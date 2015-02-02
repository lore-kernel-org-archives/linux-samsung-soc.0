From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 00/13] clk: samsung: Add the support for exynos5433 clocks
Date: Mon, 02 Feb 2015 23:23:54 +0900
Message-ID: <1422887047-30911-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sangbae90.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset adds the support for Exynos5433 CMU (Clock Management Unit)
by using common clock framework. This patchset is divided from patch[1]
and then sent it.
[1] https://lkml.org/lkml/2014/12/2/134

Changelog:

Changes from v4:
- Add input clock information to binding document

Changes from v3:
- Use 'oscclk' clock name instead of 'fin_pll'
- Add the clock dependencies between clock domains on first patch of this patch-set

Changes from v2:
- Fix the parent clock of sclk_bus_pll/sclk_mfc_pll clock on CMU_MIF domain
- Fix wrong clock name of 'phyclk_usbdrd30_udrd30_{pipe_pclk|phyclock}_phy' clock
- Add the clock id for CMU_FSYS fixed clock
- Fix wrong bit width of CLK_DIV_SCLK_SCI clock on CMU_PERIC domain
- Remove duplicat parent clocks on CMU_DISP/CMU_AUD domains
- Fix typo on patch descriptions
- Fix wrong fixed rate on CMU_AUD domain (ioclk_{jtag_|slimbus_|i2s_b}clk)
- Add CLK_IGNORE_UNUSED flag to 'aclk_dmac/sclk_aud_i2s' clock for audio subsystem
- Fix the parent clock of mout_aclk_fsys_200_user clock from aclk_fsys_200 to div_aclk_fsys_200

Changes from v1:
- Fix wrong register and code clean by using space instead of tab [Pankaj]
- Add CLK_IGNORE_UNUSED flag to pclk_sysreg_* clock for accessing system control register
- Remove duplicate definition on the patch for CMU_BUS{0|1|2} domain

Chanwoo Choi (13):
  clk: samsung: exynos5433: Add binding document for Exynos5433 clock domains
  clk: samsung: exynos5433: Add clocks using common clock framework
  clk: samsung: exynos5433: Add MUX clocks of CMU_TOP domain
  clk: samsung: exynos5433: Add clocks for CMU_PERIC domain
  clk: samsung: exynos5433: Add clocks for CMU_PERIS domain
  clk: samsung: exynos5433: Add clocks for CMU_G2D domain
  clk: samsung: exynos5433: Add clocks for CMU_MIF domain
  clk: samsung: exynos5433: Add clocks for CMU_DISP domain
  clk: samsung: exynos5433: Add clocks for CMU_AUD domain
  clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
  clk: samsung: exynos5433: Add missing clocks for CMU_FSYS domain
  clk: samsung: exynos5433: Add clocks for CMU_G3D domain
  clk: samsung: exynos5433: Add clocks for CMU_GSCL domain

 .../devicetree/bindings/clock/exynos5433-clock.txt |  305 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5433.c               | 3395 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5433.h             |  857 +++++
 4 files changed, 4558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
 create mode 100644 drivers/clk/samsung/clk-exynos5433.c
 create mode 100644 include/dt-bindings/clock/exynos5433.h

-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
