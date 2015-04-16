
NO_LIB := axi_fifo common ip_pid_controller prcfg 
LIBRARIES := $(filter-out $(NO_LIB), $(shell ls library))
NO_PROJ := 
PROJECTS := $(filter-out $(NO_PROJ), $(shell ls projects))

all:
	for libname in $(LIBRARIES) ; do \
	    make $$libname; \
	done

define LIBRARY_RULE
$1:
	cd library/$1; vivado -mode batch -source $1_ip.tcl 
endef

$(foreach libname,$(LIBRARIES), $(eval $(call LIBRARY_RULE,$(libname))))

define PROJECT_RULE
$1.$2:
	cd projects/$1/$2; vivado -mode batch -source system_project.tcl 
endef

define APROJECT_RULE
$(foreach archname,$(shell ls projects/$1), $(eval $(call PROJECT_RULE,$1,$(archname))))
endef

$(foreach projname,$(PROJECTS), $(eval $(call APROJECT_RULE,$(projname))))

distclean: clean
	@for name in $(LIBRARIES) ; do \
	    rm -rf library/$$name/*.backup.jou; \
	    rm -rf library/$$name/*.backup.log; \
	    rm -rf library/$$name/*.cache; \
	    rm -rf library/$$name/component.xml; \
	    rm -rf library/$$name/vivado.jou; \
	    rm -rf library/$$name/vivado.log; \
	    rm -rf library/$$name/xgui; \
	    rm -rf library/$$name/*.xpr; \
	done

clean:
	@for name in $(PROJECTS) ; do \
	    rm -rf projects/$$name/*/*.cache; \
	    rm -rf projects/$$name/*/ps_clock_registers.log; \
	    rm -rf projects/$$name/*/*.runs; \
	    rm -rf projects/$$name/*/*.sdk; \
	    rm -rf projects/$$name/*/*.srcs; \
	    rm -rf projects/$$name/*/timing_impl.log; \
	    rm -rf projects/$$name/*/timing_synth.log; \
	    rm -rf projects/$$name/*/vivado_*.backup.jou; \
	    rm -rf projects/$$name/*/vivado_*.backup.log; \
	    rm -rf projects/$$name/*/vivado.jou; \
	    rm -rf projects/$$name/*/vivado.log; \
	    rm -rf projects/$$name/*/*.xpr; \
	done
	@rm -f vivado.log vivado.jou
