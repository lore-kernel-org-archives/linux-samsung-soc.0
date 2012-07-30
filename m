From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 1/3] Move FIMD register headers to include/video/
Date: Mon, 30 Jul 2012 14:16:31 +0530
Message-ID: <CAL1wa8e3iwLqrdGd+qH4W-tj592jV6e3WrFXyJTNJHuBftBT=A@mail.gmail.com>
References: <1343637905-17764-1-git-send-email-l.krishna@samsung.com>
	<1343637905-17764-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2063462880=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1343637905-17764-2-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============2063462880==
Content-Type: multipart/alternative; boundary=bcaec520e91160220104c6081a8e

--bcaec520e91160220104c6081a8e
Content-Type: text/plain; charset=ISO-8859-1

Adding Marek.

On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna Amudala <
l.krishna@samsung.com> wrote:

> Moved the contents of regs-fb-v4.h and regs-fb.h from arch side
> to include/video/samsung_fimd.h
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h |  159 -------
>  arch/arm/plat-samsung/include/plat/regs-fb.h    |  403 -----------------
>  include/video/samsung_fimd.h                    |  533
> +++++++++++++++++++++++
>  3 files changed, 533 insertions(+), 562 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-fb.h
>  create mode 100644 include/video/samsung_fimd.h
>
> diff --git a/arch/arm/plat-samsung/include/plat/regs-fb-v4.h
> b/arch/arm/plat-samsung/include/plat/regs-fb-v4.h
> deleted file mode 100644
> index 4c3647f..0000000
> --- a/arch/arm/plat-samsung/include/plat/regs-fb-v4.h
> +++ /dev/null
> @@ -1,159 +0,0 @@
> -/* arch/arm/plat-samsung/include/plat/regs-fb-v4.h
> - *
> - * Copyright 2008 Openmoko, Inc.
> - * Copyright 2008 Simtec Electronics
> - *      http://armlinux.simtec.co.uk/
> - *      Ben Dooks <ben@simtec.co.uk>
> - *
> - * S3C64XX - new-style framebuffer register definitions
> - *
> - * This is the register set for the new style framebuffer interface
> - * found from the S3C2443 onwards and specifically the S3C64XX series
> - * S3C6400 and S3C6410.
> - *
> - * The file contains the cpu specific items which change between whichever
> - * architecture is selected. See <plat/regs-fb.h> for the core definitions
> - * that are the same.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -/* include the core definitions here, in case we really do need to
> - * override them at a later date.
> -*/
> -
> -#include <plat/regs-fb.h>
> -
> -#define S3C_FB_MAX_WIN (5)  /* number of hardware windows available. */
> -#define VIDCON1_FSTATUS_EVEN   (1 << 15)
> -
> -/* Video timing controls */
> -#define VIDTCON0                               (0x10)
> -#define VIDTCON1                               (0x14)
> -#define VIDTCON2                               (0x18)
> -
> -/* Window position controls */
> -
> -#define WINCON(_win)                           (0x20 + ((_win) * 4))
> -
> -/* OSD1 and OSD4 do not have register D */
> -
> -#define VIDOSD_BASE                            (0x40)
> -
> -#define VIDINTCON0                             (0x130)
> -
> -/* WINCONx */
> -
> -#define WINCONx_CSCWIDTH_MASK                  (0x3 << 26)
> -#define WINCONx_CSCWIDTH_SHIFT                 (26)
> -#define WINCONx_CSCWIDTH_WIDE                  (0x0 << 26)
> -#define WINCONx_CSCWIDTH_NARROW                        (0x3 << 26)
> -
> -#define WINCONx_ENLOCAL                                (1 << 22)
> -#define WINCONx_BUFSTATUS                      (1 << 21)
> -#define WINCONx_BUFSEL                         (1 << 20)
> -#define WINCONx_BUFAUTOEN                      (1 << 19)
> -#define WINCONx_YCbCr                          (1 << 13)
> -
> -#define WINCON1_LOCALSEL_CAMIF                 (1 << 23)
> -
> -#define WINCON2_LOCALSEL_CAMIF                 (1 << 23)
> -#define WINCON2_BLD_PIX                                (1 << 6)
> -
> -#define WINCON2_ALPHA_SEL                      (1 << 1)
> -#define WINCON2_BPPMODE_MASK                   (0xf << 2)
> -#define WINCON2_BPPMODE_SHIFT                  (2)
> -#define WINCON2_BPPMODE_1BPP                   (0x0 << 2)
> -#define WINCON2_BPPMODE_2BPP                   (0x1 << 2)
> -#define WINCON2_BPPMODE_4BPP                   (0x2 << 2)
> -#define WINCON2_BPPMODE_8BPP_1232              (0x4 << 2)
> -#define WINCON2_BPPMODE_16BPP_565              (0x5 << 2)
> -#define WINCON2_BPPMODE_16BPP_A1555            (0x6 << 2)
> -#define WINCON2_BPPMODE_16BPP_I1555            (0x7 << 2)
> -#define WINCON2_BPPMODE_18BPP_666              (0x8 << 2)
> -#define WINCON2_BPPMODE_18BPP_A1665            (0x9 << 2)
> -#define WINCON2_BPPMODE_19BPP_A1666            (0xa << 2)
> -#define WINCON2_BPPMODE_24BPP_888              (0xb << 2)
> -#define WINCON2_BPPMODE_24BPP_A1887            (0xc << 2)
> -#define WINCON2_BPPMODE_25BPP_A1888            (0xd << 2)
> -#define WINCON2_BPPMODE_28BPP_A4888            (0xd << 2)
> -
> -#define WINCON3_BLD_PIX                                (1 << 6)
> -
> -#define WINCON3_ALPHA_SEL                      (1 << 1)
> -#define WINCON3_BPPMODE_MASK                   (0xf << 2)
> -#define WINCON3_BPPMODE_SHIFT                  (2)
> -#define WINCON3_BPPMODE_1BPP                   (0x0 << 2)
> -#define WINCON3_BPPMODE_2BPP                   (0x1 << 2)
> -#define WINCON3_BPPMODE_4BPP                   (0x2 << 2)
> -#define WINCON3_BPPMODE_16BPP_565              (0x5 << 2)
> -#define WINCON3_BPPMODE_16BPP_A1555            (0x6 << 2)
> -#define WINCON3_BPPMODE_16BPP_I1555            (0x7 << 2)
> -#define WINCON3_BPPMODE_18BPP_666              (0x8 << 2)
> -#define WINCON3_BPPMODE_18BPP_A1665            (0x9 << 2)
> -#define WINCON3_BPPMODE_19BPP_A1666            (0xa << 2)
> -#define WINCON3_BPPMODE_24BPP_888              (0xb << 2)
> -#define WINCON3_BPPMODE_24BPP_A1887            (0xc << 2)
> -#define WINCON3_BPPMODE_25BPP_A1888            (0xd << 2)
> -#define WINCON3_BPPMODE_28BPP_A4888            (0xd << 2)
> -
> -#define VIDINTCON0_FIFIOSEL_WINDOW2            (0x10 << 5)
> -#define VIDINTCON0_FIFIOSEL_WINDOW3            (0x20 << 5)
> -#define VIDINTCON0_FIFIOSEL_WINDOW4            (0x40 << 5)
> -
> -#define DITHMODE                               (0x170)
> -#define WINxMAP(_win)                          (0x180 + ((_win) * 4))
> -
> -
> -#define DITHMODE_R_POS_MASK                    (0x3 << 5)
> -#define DITHMODE_R_POS_SHIFT                   (5)
> -#define DITHMODE_R_POS_8BIT                    (0x0 << 5)
> -#define DITHMODE_R_POS_6BIT                    (0x1 << 5)
> -#define DITHMODE_R_POS_5BIT                    (0x2 << 5)
> -
> -#define DITHMODE_G_POS_MASK                    (0x3 << 3)
> -#define DITHMODE_G_POS_SHIFT                   (3)
> -#define DITHMODE_G_POS_8BIT                    (0x0 << 3)
> -#define DITHMODE_G_POS_6BIT                    (0x1 << 3)
> -#define DITHMODE_G_POS_5BIT                    (0x2 << 3)
> -
> -#define DITHMODE_B_POS_MASK                    (0x3 << 1)
> -#define DITHMODE_B_POS_SHIFT                   (1)
> -#define DITHMODE_B_POS_8BIT                    (0x0 << 1)
> -#define DITHMODE_B_POS_6BIT                    (0x1 << 1)
> -#define DITHMODE_B_POS_5BIT                    (0x2 << 1)
> -
> -#define DITHMODE_DITH_EN                       (1 << 0)
> -
> -#define WPALCON                                        (0x1A0)
> -
> -/* Palette control */
> -/* Note for S5PC100: you can still use those macros on WPALCON (aka
> WPALCON_L),
> - * but make sure that WPALCON_H W2PAL-W4PAL entries are zeroed out */
> -#define WPALCON_W4PAL_16BPP_A555               (1 << 8)
> -#define WPALCON_W3PAL_16BPP_A555               (1 << 7)
> -#define WPALCON_W2PAL_16BPP_A555               (1 << 6)
> -
> -
> -/* Notes on per-window bpp settings
> - *
> - * Value       Win0     Win1     Win2     Win3     Win 4
> - * 0000                1(P)     1(P)     1(P)     1(P)     1(P)
> - * 0001                2(P)     2(P)     2(P)     2(P)     2(P)
> - * 0010                4(P)     4(P)     4(P)     4(P)     -none-
> - * 0011                8(P)     8(P)     -none-   -none-   -none-
> - * 0100                -none-   8(A232)  8(A232)  -none-   -none-
> - * 0101                16(565)  16(565)  16(565)  16(565)   16(565)
> - * 0110                -none-   16(A555) 16(A555) 16(A555)  16(A555)
> - * 0111                16(I555) 16(I565) 16(I555) 16(I555)  16(I555)
> - * 1000                18(666)  18(666)  18(666)  18(666)   18(666)
> - * 1001                -none-   18(A665) 18(A665) 18(A665)  16(A665)
> - * 1010                -none-   19(A666) 19(A666) 19(A666)  19(A666)
> - * 1011                24(888)  24(888)  24(888)  24(888)   24(888)
> - * 1100                -none-   24(A887) 24(A887) 24(A887)  24(A887)
> - * 1101                -none-   25(A888) 25(A888) 25(A888)  25(A888)
> - * 1110                -none-   -none-   -none-   -none-    -none-
> - * 1111                -none-   -none-   -none-   -none-    -none-
> -*/
> diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h
> b/arch/arm/plat-samsung/include/plat/regs-fb.h
> deleted file mode 100644
> index 9a78012..0000000
> --- a/arch/arm/plat-samsung/include/plat/regs-fb.h
> +++ /dev/null
> @@ -1,403 +0,0 @@
> -/* arch/arm/plat-samsung/include/plat/regs-fb.h
> - *
> - * Copyright 2008 Openmoko, Inc.
> - * Copyright 2008 Simtec Electronics
> - *      http://armlinux.simtec.co.uk/
> - *      Ben Dooks <ben@simtec.co.uk>
> - *
> - * S3C Platform - new-style framebuffer register definitions
> - *
> - * This is the register set for the new style framebuffer interface
> - * found from the S3C2443 onwards into the S3C2416, S3C2450 and the
> - * S3C64XX series such as the S3C6400 and S3C6410.
> - *
> - * The file does not contain the cpu specific items which are based on
> - * whichever architecture is selected, it only contains the core of the
> - * register set. See <mach/regs-fb.h> to get the specifics.
> - *
> - * Note, we changed to using regs-fb.h as it avoids any clashes with
> - * the original regs-lcd.h so out of the way of regs-lcd.h as well as
> - * indicating the newer block is much more than just an LCD interface.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -/* Please do not include this file directly, use <mach/regs-fb.h> to
> - * ensure all the localised SoC support is included as necessary.
> -*/
> -
> -/* VIDCON0 */
> -
> -#define VIDCON0                                        (0x00)
> -#define VIDCON0_INTERLACE                      (1 << 29)
> -#define VIDCON0_VIDOUT_MASK                    (0x3 << 26)
> -#define VIDCON0_VIDOUT_SHIFT                   (26)
> -#define VIDCON0_VIDOUT_RGB                     (0x0 << 26)
> -#define VIDCON0_VIDOUT_TV                      (0x1 << 26)
> -#define VIDCON0_VIDOUT_I80_LDI0                        (0x2 << 26)
> -#define VIDCON0_VIDOUT_I80_LDI1                        (0x3 << 26)
> -
> -#define VIDCON0_L1_DATA_MASK                   (0x7 << 23)
> -#define VIDCON0_L1_DATA_SHIFT                  (23)
> -#define VIDCON0_L1_DATA_16BPP                  (0x0 << 23)
> -#define VIDCON0_L1_DATA_18BPP16                        (0x1 << 23)
> -#define VIDCON0_L1_DATA_18BPP9                 (0x2 << 23)
> -#define VIDCON0_L1_DATA_24BPP                  (0x3 << 23)
> -#define VIDCON0_L1_DATA_18BPP                  (0x4 << 23)
> -#define VIDCON0_L1_DATA_16BPP8                 (0x5 << 23)
> -
> -#define VIDCON0_L0_DATA_MASK                   (0x7 << 20)
> -#define VIDCON0_L0_DATA_SHIFT                  (20)
> -#define VIDCON0_L0_DATA_16BPP                  (0x0 << 20)
> -#define VIDCON0_L0_DATA_18BPP16                        (0x1 << 20)
> -#define VIDCON0_L0_DATA_18BPP9                 (0x2 << 20)
> -#define VIDCON0_L0_DATA_24BPP                  (0x3 << 20)
> -#define VIDCON0_L0_DATA_18BPP                  (0x4 << 20)
> -#define VIDCON0_L0_DATA_16BPP8                 (0x5 << 20)
> -
> -#define VIDCON0_PNRMODE_MASK                   (0x3 << 17)
> -#define VIDCON0_PNRMODE_SHIFT                  (17)
> -#define VIDCON0_PNRMODE_RGB                    (0x0 << 17)
> -#define VIDCON0_PNRMODE_BGR                    (0x1 << 17)
> -#define VIDCON0_PNRMODE_SERIAL_RGB             (0x2 << 17)
> -#define VIDCON0_PNRMODE_SERIAL_BGR             (0x3 << 17)
> -
> -#define VIDCON0_CLKVALUP                       (1 << 16)
> -#define VIDCON0_CLKVAL_F_MASK                  (0xff << 6)
> -#define VIDCON0_CLKVAL_F_SHIFT                 (6)
> -#define VIDCON0_CLKVAL_F_LIMIT                 (0xff)
> -#define VIDCON0_CLKVAL_F(_x)                   ((_x) << 6)
> -#define VIDCON0_VLCKFREE                       (1 << 5)
> -#define VIDCON0_CLKDIR                         (1 << 4)
> -
> -#define VIDCON0_CLKSEL_MASK                    (0x3 << 2)
> -#define VIDCON0_CLKSEL_SHIFT                   (2)
> -#define VIDCON0_CLKSEL_HCLK                    (0x0 << 2)
> -#define VIDCON0_CLKSEL_LCD                     (0x1 << 2)
> -#define VIDCON0_CLKSEL_27M                     (0x3 << 2)
> -
> -#define VIDCON0_ENVID                          (1 << 1)
> -#define VIDCON0_ENVID_F                                (1 << 0)
> -
> -#define VIDCON1                                        (0x04)
> -#define VIDCON1_LINECNT_MASK                   (0x7ff << 16)
> -#define VIDCON1_LINECNT_SHIFT                  (16)
> -#define VIDCON1_LINECNT_GET(_v)                        (((_v) >> 16) &
> 0x7ff)
> -#define VIDCON1_VSTATUS_MASK                   (0x3 << 13)
> -#define VIDCON1_VSTATUS_SHIFT                  (13)
> -#define VIDCON1_VSTATUS_VSYNC                  (0x0 << 13)
> -#define VIDCON1_VSTATUS_BACKPORCH              (0x1 << 13)
> -#define VIDCON1_VSTATUS_ACTIVE                 (0x2 << 13)
> -#define VIDCON1_VSTATUS_FRONTPORCH             (0x0 << 13)
> -#define VIDCON1_VCLK_MASK                      (0x3 << 9)
> -#define VIDCON1_VCLK_HOLD                      (0x0 << 9)
> -#define VIDCON1_VCLK_RUN                       (0x1 << 9)
> -
> -#define VIDCON1_INV_VCLK                       (1 << 7)
> -#define VIDCON1_INV_HSYNC                      (1 << 6)
> -#define VIDCON1_INV_VSYNC                      (1 << 5)
> -#define VIDCON1_INV_VDEN                       (1 << 4)
> -
> -/* VIDCON2 */
> -
> -#define VIDCON2                                        (0x08)
> -#define VIDCON2_EN601                          (1 << 23)
> -#define VIDCON2_TVFMTSEL_SW                    (1 << 14)
> -
> -#define VIDCON2_TVFMTSEL1_MASK                 (0x3 << 12)
> -#define VIDCON2_TVFMTSEL1_SHIFT                        (12)
> -#define VIDCON2_TVFMTSEL1_RGB                  (0x0 << 12)
> -#define VIDCON2_TVFMTSEL1_YUV422               (0x1 << 12)
> -#define VIDCON2_TVFMTSEL1_YUV444               (0x2 << 12)
> -
> -#define VIDCON2_ORGYCbCr                       (1 << 8)
> -#define VIDCON2_YUVORDCrCb                     (1 << 7)
> -
> -/* PRTCON (S3C6410, S5PC100)
> - * Might not be present in the S3C6410 documentation,
> - * but tests prove it's there almost for sure; shouldn't hurt in any case.
> - */
> -#define PRTCON                                 (0x0c)
> -#define PRTCON_PROTECT                         (1 << 11)
> -
> -/* VIDTCON0 */
> -
> -#define VIDTCON0_VBPDE_MASK                    (0xff << 24)
> -#define VIDTCON0_VBPDE_SHIFT                   (24)
> -#define VIDTCON0_VBPDE_LIMIT                   (0xff)
> -#define VIDTCON0_VBPDE(_x)                     ((_x) << 24)
> -
> -#define VIDTCON0_VBPD_MASK                     (0xff << 16)
> -#define VIDTCON0_VBPD_SHIFT                    (16)
> -#define VIDTCON0_VBPD_LIMIT                    (0xff)
> -#define VIDTCON0_VBPD(_x)                      ((_x) << 16)
> -
> -#define VIDTCON0_VFPD_MASK                     (0xff << 8)
> -#define VIDTCON0_VFPD_SHIFT                    (8)
> -#define VIDTCON0_VFPD_LIMIT                    (0xff)
> -#define VIDTCON0_VFPD(_x)                      ((_x) << 8)
> -
> -#define VIDTCON0_VSPW_MASK                     (0xff << 0)
> -#define VIDTCON0_VSPW_SHIFT                    (0)
> -#define VIDTCON0_VSPW_LIMIT                    (0xff)
> -#define VIDTCON0_VSPW(_x)                      ((_x) << 0)
> -
> -/* VIDTCON1 */
> -
> -#define VIDTCON1_VFPDE_MASK                    (0xff << 24)
> -#define VIDTCON1_VFPDE_SHIFT                   (24)
> -#define VIDTCON1_VFPDE_LIMIT                   (0xff)
> -#define VIDTCON1_VFPDE(_x)                     ((_x) << 24)
> -
> -#define VIDTCON1_HBPD_MASK                     (0xff << 16)
> -#define VIDTCON1_HBPD_SHIFT                    (16)
> -#define VIDTCON1_HBPD_LIMIT                    (0xff)
> -#define VIDTCON1_HBPD(_x)                      ((_x) << 16)
> -
> -#define VIDTCON1_HFPD_MASK                     (0xff << 8)
> -#define VIDTCON1_HFPD_SHIFT                    (8)
> -#define VIDTCON1_HFPD_LIMIT                    (0xff)
> -#define VIDTCON1_HFPD(_x)                      ((_x) << 8)
> -
> -#define VIDTCON1_HSPW_MASK                     (0xff << 0)
> -#define VIDTCON1_HSPW_SHIFT                    (0)
> -#define VIDTCON1_HSPW_LIMIT                    (0xff)
> -#define VIDTCON1_HSPW(_x)                      ((_x) << 0)
> -
> -#define VIDTCON2                               (0x18)
> -#define VIDTCON2_LINEVAL_E(_x)                 ((((_x) & 0x800) >> 11) <<
> 23)
> -#define VIDTCON2_LINEVAL_MASK                  (0x7ff << 11)
> -#define VIDTCON2_LINEVAL_SHIFT                 (11)
> -#define VIDTCON2_LINEVAL_LIMIT                 (0x7ff)
> -#define VIDTCON2_LINEVAL(_x)                   (((_x) & 0x7ff) << 11)
> -
> -#define VIDTCON2_HOZVAL_E(_x)                  ((((_x) & 0x800) >> 11) <<
> 22)
> -#define VIDTCON2_HOZVAL_MASK                   (0x7ff << 0)
> -#define VIDTCON2_HOZVAL_SHIFT                  (0)
> -#define VIDTCON2_HOZVAL_LIMIT                  (0x7ff)
> -#define VIDTCON2_HOZVAL(_x)                    (((_x) & 0x7ff) << 0)
> -
> -/* WINCONx */
> -
> -
> -#define WINCONx_BITSWP                         (1 << 18)
> -#define WINCONx_BYTSWP                         (1 << 17)
> -#define WINCONx_HAWSWP                         (1 << 16)
> -#define WINCONx_WSWP                           (1 << 15)
> -#define WINCONx_BURSTLEN_MASK                  (0x3 << 9)
> -#define WINCONx_BURSTLEN_SHIFT                 (9)
> -#define WINCONx_BURSTLEN_16WORD                        (0x0 << 9)
> -#define WINCONx_BURSTLEN_8WORD                 (0x1 << 9)
> -#define WINCONx_BURSTLEN_4WORD                 (0x2 << 9)
> -
> -#define WINCONx_ENWIN                          (1 << 0)
> -#define WINCON0_BPPMODE_MASK                   (0xf << 2)
> -#define WINCON0_BPPMODE_SHIFT                  (2)
> -#define WINCON0_BPPMODE_1BPP                   (0x0 << 2)
> -#define WINCON0_BPPMODE_2BPP                   (0x1 << 2)
> -#define WINCON0_BPPMODE_4BPP                   (0x2 << 2)
> -#define WINCON0_BPPMODE_8BPP_PALETTE           (0x3 << 2)
> -#define WINCON0_BPPMODE_16BPP_565              (0x5 << 2)
> -#define WINCON0_BPPMODE_16BPP_1555             (0x7 << 2)
> -#define WINCON0_BPPMODE_18BPP_666              (0x8 << 2)
> -#define WINCON0_BPPMODE_24BPP_888              (0xb << 2)
> -
> -#define WINCON1_BLD_PIX                                (1 << 6)
> -
> -#define WINCON1_ALPHA_SEL                      (1 << 1)
> -#define WINCON1_BPPMODE_MASK                   (0xf << 2)
> -#define WINCON1_BPPMODE_SHIFT                  (2)
> -#define WINCON1_BPPMODE_1BPP                   (0x0 << 2)
> -#define WINCON1_BPPMODE_2BPP                   (0x1 << 2)
> -#define WINCON1_BPPMODE_4BPP                   (0x2 << 2)
> -#define WINCON1_BPPMODE_8BPP_PALETTE           (0x3 << 2)
> -#define WINCON1_BPPMODE_8BPP_1232              (0x4 << 2)
> -#define WINCON1_BPPMODE_16BPP_565              (0x5 << 2)
> -#define WINCON1_BPPMODE_16BPP_A1555            (0x6 << 2)
> -#define WINCON1_BPPMODE_16BPP_I1555            (0x7 << 2)
> -#define WINCON1_BPPMODE_18BPP_666              (0x8 << 2)
> -#define WINCON1_BPPMODE_18BPP_A1665            (0x9 << 2)
> -#define WINCON1_BPPMODE_19BPP_A1666            (0xa << 2)
> -#define WINCON1_BPPMODE_24BPP_888              (0xb << 2)
> -#define WINCON1_BPPMODE_24BPP_A1887            (0xc << 2)
> -#define WINCON1_BPPMODE_25BPP_A1888            (0xd << 2)
> -#define WINCON1_BPPMODE_28BPP_A4888            (0xd << 2)
> -
> -/* S5PV210 */
> -#define SHADOWCON                              (0x34)
> -#define SHADOWCON_WINx_PROTECT(_win)           (1 << (10 + (_win)))
> -/* DMA channels (all windows) */
> -#define SHADOWCON_CHx_ENABLE(_win)             (1 << (_win))
> -/* Local input channels (windows 0-2) */
> -#define SHADOWCON_CHx_LOCAL_ENABLE(_win)       (1 << (5 + (_win)))
> -
> -#define VIDOSDxA_TOPLEFT_X_E(_x)               ((((_x) & 0x800) >> 11) <<
> 23)
> -#define VIDOSDxA_TOPLEFT_X_MASK                        (0x7ff << 11)
> -#define VIDOSDxA_TOPLEFT_X_SHIFT               (11)
> -#define VIDOSDxA_TOPLEFT_X_LIMIT               (0x7ff)
> -#define VIDOSDxA_TOPLEFT_X(_x)                 (((_x) & 0x7ff) << 11)
> -
> -#define VIDOSDxA_TOPLEFT_Y_E(_x)               ((((_x) & 0x800) >> 11) <<
> 22)
> -#define VIDOSDxA_TOPLEFT_Y_MASK                        (0x7ff << 0)
> -#define VIDOSDxA_TOPLEFT_Y_SHIFT               (0)
> -#define VIDOSDxA_TOPLEFT_Y_LIMIT               (0x7ff)
> -#define VIDOSDxA_TOPLEFT_Y(_x)                 (((_x) & 0x7ff) << 0)
> -
> -#define VIDOSDxB_BOTRIGHT_X_E(_x)              ((((_x) & 0x800) >> 11) <<
> 23)
> -#define VIDOSDxB_BOTRIGHT_X_MASK               (0x7ff << 11)
> -#define VIDOSDxB_BOTRIGHT_X_SHIFT              (11)
> -#define VIDOSDxB_BOTRIGHT_X_LIMIT              (0x7ff)
> -#define VIDOSDxB_BOTRIGHT_X(_x)                        (((_x) & 0x7ff) <<
> 11)
> -
> -#define VIDOSDxB_BOTRIGHT_Y_E(_x)              ((((_x) & 0x800) >> 11) <<
> 22)
> -#define VIDOSDxB_BOTRIGHT_Y_MASK               (0x7ff << 0)
> -#define VIDOSDxB_BOTRIGHT_Y_SHIFT              (0)
> -#define VIDOSDxB_BOTRIGHT_Y_LIMIT              (0x7ff)
> -#define VIDOSDxB_BOTRIGHT_Y(_x)                        (((_x) & 0x7ff) <<
> 0)
> -
> -/* For VIDOSD[1..4]C */
> -#define VIDISD14C_ALPHA0_R(_x)                 ((_x) << 20)
> -#define VIDISD14C_ALPHA0_G_MASK                        (0xf << 16)
> -#define VIDISD14C_ALPHA0_G_SHIFT               (16)
> -#define VIDISD14C_ALPHA0_G_LIMIT               (0xf)
> -#define VIDISD14C_ALPHA0_G(_x)                 ((_x) << 16)
> -#define VIDISD14C_ALPHA0_B_MASK                        (0xf << 12)
> -#define VIDISD14C_ALPHA0_B_SHIFT               (12)
> -#define VIDISD14C_ALPHA0_B_LIMIT               (0xf)
> -#define VIDISD14C_ALPHA0_B(_x)                 ((_x) << 12)
> -#define VIDISD14C_ALPHA1_R_MASK                        (0xf << 8)
> -#define VIDISD14C_ALPHA1_R_SHIFT               (8)
> -#define VIDISD14C_ALPHA1_R_LIMIT               (0xf)
> -#define VIDISD14C_ALPHA1_R(_x)                 ((_x) << 8)
> -#define VIDISD14C_ALPHA1_G_MASK                        (0xf << 4)
> -#define VIDISD14C_ALPHA1_G_SHIFT               (4)
> -#define VIDISD14C_ALPHA1_G_LIMIT               (0xf)
> -#define VIDISD14C_ALPHA1_G(_x)                 ((_x) << 4)
> -#define VIDISD14C_ALPHA1_B_MASK                        (0xf << 0)
> -#define VIDISD14C_ALPHA1_B_SHIFT               (0)
> -#define VIDISD14C_ALPHA1_B_LIMIT               (0xf)
> -#define VIDISD14C_ALPHA1_B(_x)                 ((_x) << 0)
> -
> -/* Video buffer addresses */
> -#define VIDW_BUF_START(_buff)                  (0xA0 + ((_buff) * 8))
> -#define VIDW_BUF_START1(_buff)                 (0xA4 + ((_buff) * 8))
> -#define VIDW_BUF_END(_buff)                    (0xD0 + ((_buff) * 8))
> -#define VIDW_BUF_END1(_buff)                   (0xD4 + ((_buff) * 8))
> -#define VIDW_BUF_SIZE(_buff)                   (0x100 + ((_buff) * 4))
> -
> -#define VIDW_BUF_SIZE_OFFSET_E(_x)             ((((_x) & 0x2000) >> 13)
> << 27)
> -#define VIDW_BUF_SIZE_OFFSET_MASK              (0x1fff << 13)
> -#define VIDW_BUF_SIZE_OFFSET_SHIFT             (13)
> -#define VIDW_BUF_SIZE_OFFSET_LIMIT             (0x1fff)
> -#define VIDW_BUF_SIZE_OFFSET(_x)               (((_x) & 0x1fff) << 13)
> -
> -#define VIDW_BUF_SIZE_PAGEWIDTH_E(_x)          ((((_x) & 0x2000) >> 13)
> << 26)
> -#define VIDW_BUF_SIZE_PAGEWIDTH_MASK           (0x1fff << 0)
> -#define VIDW_BUF_SIZE_PAGEWIDTH_SHIFT          (0)
> -#define VIDW_BUF_SIZE_PAGEWIDTH_LIMIT          (0x1fff)
> -#define VIDW_BUF_SIZE_PAGEWIDTH(_x)            (((_x) & 0x1fff) << 0)
> -
> -/* Interrupt controls and status */
> -
> -#define VIDINTCON0_FIFOINTERVAL_MASK           (0x3f << 20)
> -#define VIDINTCON0_FIFOINTERVAL_SHIFT          (20)
> -#define VIDINTCON0_FIFOINTERVAL_LIMIT          (0x3f)
> -#define VIDINTCON0_FIFOINTERVAL(_x)            ((_x) << 20)
> -
> -#define VIDINTCON0_INT_SYSMAINCON              (1 << 19)
> -#define VIDINTCON0_INT_SYSSUBCON               (1 << 18)
> -#define VIDINTCON0_INT_I80IFDONE               (1 << 17)
> -
> -#define VIDINTCON0_FRAMESEL0_MASK              (0x3 << 15)
> -#define VIDINTCON0_FRAMESEL0_SHIFT             (15)
> -#define VIDINTCON0_FRAMESEL0_BACKPORCH         (0x0 << 15)
> -#define VIDINTCON0_FRAMESEL0_VSYNC             (0x1 << 15)
> -#define VIDINTCON0_FRAMESEL0_ACTIVE            (0x2 << 15)
> -#define VIDINTCON0_FRAMESEL0_FRONTPORCH                (0x3 << 15)
> -
> -#define VIDINTCON0_FRAMESEL1                   (1 << 13)
> -#define VIDINTCON0_FRAMESEL1_MASK              (0x3 << 13)
> -#define VIDINTCON0_FRAMESEL1_NONE              (0x0 << 13)
> -#define VIDINTCON0_FRAMESEL1_BACKPORCH         (0x1 << 13)
> -#define VIDINTCON0_FRAMESEL1_VSYNC             (0x2 << 13)
> -#define VIDINTCON0_FRAMESEL1_FRONTPORCH                (0x3 << 13)
> -
> -#define VIDINTCON0_INT_FRAME                   (1 << 12)
> -#define VIDINTCON0_FIFIOSEL_MASK               (0x7f << 5)
> -#define VIDINTCON0_FIFIOSEL_SHIFT              (5)
> -#define VIDINTCON0_FIFIOSEL_WINDOW0            (0x1 << 5)
> -#define VIDINTCON0_FIFIOSEL_WINDOW1            (0x2 << 5)
> -
> -#define VIDINTCON0_FIFOLEVEL_MASK              (0x7 << 2)
> -#define VIDINTCON0_FIFOLEVEL_SHIFT             (2)
> -#define VIDINTCON0_FIFOLEVEL_TO25PC            (0x0 << 2)
> -#define VIDINTCON0_FIFOLEVEL_TO50PC            (0x1 << 2)
> -#define VIDINTCON0_FIFOLEVEL_TO75PC            (0x2 << 2)
> -#define VIDINTCON0_FIFOLEVEL_EMPTY             (0x3 << 2)
> -#define VIDINTCON0_FIFOLEVEL_FULL              (0x4 << 2)
> -
> -#define VIDINTCON0_INT_FIFO_MASK               (0x3 << 0)
> -#define VIDINTCON0_INT_FIFO_SHIFT              (0)
> -#define VIDINTCON0_INT_ENABLE                  (1 << 0)
> -
> -#define VIDINTCON1                             (0x134)
> -#define VIDINTCON1_INT_I180                    (1 << 2)
> -#define VIDINTCON1_INT_FRAME                   (1 << 1)
> -#define VIDINTCON1_INT_FIFO                    (1 << 0)
> -
> -/* Window colour-key control registers */
> -#define WKEYCON                                        (0x140) /*
> 6410,V210 */
> -
> -#define WKEYCON0                               (0x00)
> -#define WKEYCON1                               (0x04)
> -
> -#define WxKEYCON0_KEYBL_EN                     (1 << 26)
> -#define WxKEYCON0_KEYEN_F                      (1 << 25)
> -#define WxKEYCON0_DIRCON                       (1 << 24)
> -#define WxKEYCON0_COMPKEY_MASK                 (0xffffff << 0)
> -#define WxKEYCON0_COMPKEY_SHIFT                        (0)
> -#define WxKEYCON0_COMPKEY_LIMIT                        (0xffffff)
> -#define WxKEYCON0_COMPKEY(_x)                  ((_x) << 0)
> -#define WxKEYCON1_COLVAL_MASK                  (0xffffff << 0)
> -#define WxKEYCON1_COLVAL_SHIFT                 (0)
> -#define WxKEYCON1_COLVAL_LIMIT                 (0xffffff)
> -#define WxKEYCON1_COLVAL(_x)                   ((_x) << 0)
> -
> -
> -/* Window blanking (MAP) */
> -
> -#define WINxMAP_MAP                            (1 << 24)
> -#define WINxMAP_MAP_COLOUR_MASK                        (0xffffff << 0)
> -#define WINxMAP_MAP_COLOUR_SHIFT               (0)
> -#define WINxMAP_MAP_COLOUR_LIMIT               (0xffffff)
> -#define WINxMAP_MAP_COLOUR(_x)                 ((_x) << 0)
> -
> -#define WPALCON_PAL_UPDATE                     (1 << 9)
> -#define WPALCON_W1PAL_MASK                     (0x7 << 3)
> -#define WPALCON_W1PAL_SHIFT                    (3)
> -#define WPALCON_W1PAL_25BPP_A888               (0x0 << 3)
> -#define WPALCON_W1PAL_24BPP                    (0x1 << 3)
> -#define WPALCON_W1PAL_19BPP_A666               (0x2 << 3)
> -#define WPALCON_W1PAL_18BPP_A665               (0x3 << 3)
> -#define WPALCON_W1PAL_18BPP                    (0x4 << 3)
> -#define WPALCON_W1PAL_16BPP_A555               (0x5 << 3)
> -#define WPALCON_W1PAL_16BPP_565                        (0x6 << 3)
> -
> -#define WPALCON_W0PAL_MASK                     (0x7 << 0)
> -#define WPALCON_W0PAL_SHIFT                    (0)
> -#define WPALCON_W0PAL_25BPP_A888               (0x0 << 0)
> -#define WPALCON_W0PAL_24BPP                    (0x1 << 0)
> -#define WPALCON_W0PAL_19BPP_A666               (0x2 << 0)
> -#define WPALCON_W0PAL_18BPP_A665               (0x3 << 0)
> -#define WPALCON_W0PAL_18BPP                    (0x4 << 0)
> -#define WPALCON_W0PAL_16BPP_A555               (0x5 << 0)
> -#define WPALCON_W0PAL_16BPP_565                        (0x6 << 0)
> -
> -/* Blending equation control */
> -#define BLENDCON                               (0x260)
> -#define BLENDCON_NEW_MASK                      (1 << 0)
> -#define BLENDCON_NEW_8BIT_ALPHA_VALUE          (1 << 0)
> -#define BLENDCON_NEW_4BIT_ALPHA_VALUE          (0 << 0)
> -
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> new file mode 100644
> index 0000000..1b5ff4c
> --- /dev/null
> +++ b/include/video/samsung_fimd.h
> @@ -0,0 +1,533 @@
> +/* include/video/samsung_fimd.h
> + *
> + * Copyright 2008 Openmoko, Inc.
> + * Copyright 2008 Simtec Electronics
> + *      http://armlinux.simtec.co.uk/
> + *      Ben Dooks <ben@simtec.co.uk>
> + *
> + * S3C Platform - new-style fimd and framebuffer register definitions
> + *
> + * This is the register set for the fimd and new style framebuffer
> interface
> + * found from the S3C2443 onwards into the S3C2416, S3C2450 and the
> + * S3C64XX series such as the S3C6400 and S3C6410.
> + *
> + * The file does not contain the cpu specific items which are based on
> + * whichever architecture is selected, it only contains the core of the
> + * register set. See <mach/regs-fb.h> to get the specifics.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* VIDCON0 */
> +
> +#define VIDCON0                                        (0x00)
> +#define VIDCON0_INTERLACE                      (1 << 29)
> +#define VIDCON0_VIDOUT_MASK                    (0x3 << 26)
> +#define VIDCON0_VIDOUT_SHIFT                   (26)
> +#define VIDCON0_VIDOUT_RGB                     (0x0 << 26)
> +#define VIDCON0_VIDOUT_TV                      (0x1 << 26)
> +#define VIDCON0_VIDOUT_I80_LDI0                        (0x2 << 26)
> +#define VIDCON0_VIDOUT_I80_LDI1                        (0x3 << 26)
> +
> +#define VIDCON0_L1_DATA_MASK                   (0x7 << 23)
> +#define VIDCON0_L1_DATA_SHIFT                  (23)
> +#define VIDCON0_L1_DATA_16BPP                  (0x0 << 23)
> +#define VIDCON0_L1_DATA_18BPP16                        (0x1 << 23)
> +#define VIDCON0_L1_DATA_18BPP9                 (0x2 << 23)
> +#define VIDCON0_L1_DATA_24BPP                  (0x3 << 23)
> +#define VIDCON0_L1_DATA_18BPP                  (0x4 << 23)
> +#define VIDCON0_L1_DATA_16BPP8                 (0x5 << 23)
> +
> +#define VIDCON0_L0_DATA_MASK                   (0x7 << 20)
> +#define VIDCON0_L0_DATA_SHIFT                  (20)
> +#define VIDCON0_L0_DATA_16BPP                  (0x0 << 20)
> +#define VIDCON0_L0_DATA_18BPP16                        (0x1 << 20)
> +#define VIDCON0_L0_DATA_18BPP9                 (0x2 << 20)
> +#define VIDCON0_L0_DATA_24BPP                  (0x3 << 20)
> +#define VIDCON0_L0_DATA_18BPP                  (0x4 << 20)
> +#define VIDCON0_L0_DATA_16BPP8                 (0x5 << 20)
> +
> +#define VIDCON0_PNRMODE_MASK                   (0x3 << 17)
> +#define VIDCON0_PNRMODE_SHIFT                  (17)
> +#define VIDCON0_PNRMODE_RGB                    (0x0 << 17)
> +#define VIDCON0_PNRMODE_BGR                    (0x1 << 17)
> +#define VIDCON0_PNRMODE_SERIAL_RGB             (0x2 << 17)
> +#define VIDCON0_PNRMODE_SERIAL_BGR             (0x3 << 17)
> +
> +#define VIDCON0_CLKVALUP                       (1 << 16)
> +#define VIDCON0_CLKVAL_F_MASK                  (0xff << 6)
> +#define VIDCON0_CLKVAL_F_SHIFT                 (6)
> +#define VIDCON0_CLKVAL_F_LIMIT                 (0xff)
> +#define VIDCON0_CLKVAL_F(_x)                   ((_x) << 6)
> +#define VIDCON0_VLCKFREE                       (1 << 5)
> +#define VIDCON0_CLKDIR                         (1 << 4)
> +
> +#define VIDCON0_CLKSEL_MASK                    (0x3 << 2)
> +#define VIDCON0_CLKSEL_SHIFT                   (2)
> +#define VIDCON0_CLKSEL_HCLK                    (0x0 << 2)
> +#define VIDCON0_CLKSEL_LCD                     (0x1 << 2)
> +#define VIDCON0_CLKSEL_27M                     (0x3 << 2)
> +
> +#define VIDCON0_ENVID                          (1 << 1)
> +#define VIDCON0_ENVID_F                                (1 << 0)
> +
> +#define VIDCON1                                        (0x04)
> +#define VIDCON1_LINECNT_MASK                   (0x7ff << 16)
> +#define VIDCON1_LINECNT_SHIFT                  (16)
> +#define VIDCON1_LINECNT_GET(_v)                        (((_v) >> 16) &
> 0x7ff)
> +#define VIDCON1_VSTATUS_MASK                   (0x3 << 13)
> +#define VIDCON1_VSTATUS_SHIFT                  (13)
> +#define VIDCON1_VSTATUS_VSYNC                  (0x0 << 13)
> +#define VIDCON1_VSTATUS_BACKPORCH              (0x1 << 13)
> +#define VIDCON1_VSTATUS_ACTIVE                 (0x2 << 13)
> +#define VIDCON1_VSTATUS_FRONTPORCH             (0x0 << 13)
> +#define VIDCON1_VCLK_MASK                      (0x3 << 9)
> +#define VIDCON1_VCLK_HOLD                      (0x0 << 9)
> +#define VIDCON1_VCLK_RUN                       (0x1 << 9)
> +
> +#define VIDCON1_INV_VCLK                       (1 << 7)
> +#define VIDCON1_INV_HSYNC                      (1 << 6)
> +#define VIDCON1_INV_VSYNC                      (1 << 5)
> +#define VIDCON1_INV_VDEN                       (1 << 4)
> +
> +/* VIDCON2 */
> +
> +#define VIDCON2                                        (0x08)
> +#define VIDCON2_EN601                          (1 << 23)
> +#define VIDCON2_TVFMTSEL_SW                    (1 << 14)
> +
> +#define VIDCON2_TVFMTSEL1_MASK                 (0x3 << 12)
> +#define VIDCON2_TVFMTSEL1_SHIFT                        (12)
> +#define VIDCON2_TVFMTSEL1_RGB                  (0x0 << 12)
> +#define VIDCON2_TVFMTSEL1_YUV422               (0x1 << 12)
> +#define VIDCON2_TVFMTSEL1_YUV444               (0x2 << 12)
> +
> +#define VIDCON2_ORGYCbCr                       (1 << 8)
> +#define VIDCON2_YUVORDCrCb                     (1 << 7)
> +
> +/* PRTCON (S3C6410, S5PC100)
> + * Might not be present in the S3C6410 documentation,
> + * but tests prove it's there almost for sure; shouldn't hurt in any case.
> + */
> +#define PRTCON                                 (0x0c)
> +#define PRTCON_PROTECT                         (1 << 11)
> +
> +/* VIDTCON0 */
> +
> +#define VIDTCON0_VBPDE_MASK                    (0xff << 24)
> +#define VIDTCON0_VBPDE_SHIFT                   (24)
> +#define VIDTCON0_VBPDE_LIMIT                   (0xff)
> +#define VIDTCON0_VBPDE(_x)                     ((_x) << 24)
> +
> +#define VIDTCON0_VBPD_MASK                     (0xff << 16)
> +#define VIDTCON0_VBPD_SHIFT                    (16)
> +#define VIDTCON0_VBPD_LIMIT                    (0xff)
> +#define VIDTCON0_VBPD(_x)                      ((_x) << 16)
> +
> +#define VIDTCON0_VFPD_MASK                     (0xff << 8)
> +#define VIDTCON0_VFPD_SHIFT                    (8)
> +#define VIDTCON0_VFPD_LIMIT                    (0xff)
> +#define VIDTCON0_VFPD(_x)                      ((_x) << 8)
> +
> +#define VIDTCON0_VSPW_MASK                     (0xff << 0)
> +#define VIDTCON0_VSPW_SHIFT                    (0)
> +#define VIDTCON0_VSPW_LIMIT                    (0xff)
> +#define VIDTCON0_VSPW(_x)                      ((_x) << 0)
> +
> +/* VIDTCON1 */
> +
> +#define VIDTCON1_VFPDE_MASK                    (0xff << 24)
> +#define VIDTCON1_VFPDE_SHIFT                   (24)
> +#define VIDTCON1_VFPDE_LIMIT                   (0xff)
> +#define VIDTCON1_VFPDE(_x)                     ((_x) << 24)
> +
> +#define VIDTCON1_HBPD_MASK                     (0xff << 16)
> +#define VIDTCON1_HBPD_SHIFT                    (16)
> +#define VIDTCON1_HBPD_LIMIT                    (0xff)
> +#define VIDTCON1_HBPD(_x)                      ((_x) << 16)
> +
> +#define VIDTCON1_HFPD_MASK                     (0xff << 8)
> +#define VIDTCON1_HFPD_SHIFT                    (8)
> +#define VIDTCON1_HFPD_LIMIT                    (0xff)
> +#define VIDTCON1_HFPD(_x)                      ((_x) << 8)
> +
> +#define VIDTCON1_HSPW_MASK                     (0xff << 0)
> +#define VIDTCON1_HSPW_SHIFT                    (0)
> +#define VIDTCON1_HSPW_LIMIT                    (0xff)
> +#define VIDTCON1_HSPW(_x)                      ((_x) << 0)
> +
> +#define VIDTCON2                               (0x18)
> +#define VIDTCON2_LINEVAL_E(_x)                 ((((_x) & 0x800) >> 11) <<
> 23)
> +#define VIDTCON2_LINEVAL_MASK                  (0x7ff << 11)
> +#define VIDTCON2_LINEVAL_SHIFT                 (11)
> +#define VIDTCON2_LINEVAL_LIMIT                 (0x7ff)
> +#define VIDTCON2_LINEVAL(_x)                   (((_x) & 0x7ff) << 11)
> +
> +#define VIDTCON2_HOZVAL_E(_x)                  ((((_x) & 0x800) >> 11) <<
> 22)
> +#define VIDTCON2_HOZVAL_MASK                   (0x7ff << 0)
> +#define VIDTCON2_HOZVAL_SHIFT                  (0)
> +#define VIDTCON2_HOZVAL_LIMIT                  (0x7ff)
> +#define VIDTCON2_HOZVAL(_x)                    (((_x) & 0x7ff) << 0)
> +
> +/* WINCONx */
> +
> +
> +#define WINCONx_BITSWP                         (1 << 18)
> +#define WINCONx_BYTSWP                         (1 << 17)
> +#define WINCONx_HAWSWP                         (1 << 16)
> +#define WINCONx_WSWP                           (1 << 15)
> +#define WINCONx_BURSTLEN_MASK                  (0x3 << 9)
> +#define WINCONx_BURSTLEN_SHIFT                 (9)
> +#define WINCONx_BURSTLEN_16WORD                        (0x0 << 9)
> +#define WINCONx_BURSTLEN_8WORD                 (0x1 << 9)
> +#define WINCONx_BURSTLEN_4WORD                 (0x2 << 9)
> +
> +#define WINCONx_ENWIN                          (1 << 0)
> +#define WINCON0_BPPMODE_MASK                   (0xf << 2)
> +#define WINCON0_BPPMODE_SHIFT                  (2)
> +#define WINCON0_BPPMODE_1BPP                   (0x0 << 2)
> +#define WINCON0_BPPMODE_2BPP                   (0x1 << 2)
> +#define WINCON0_BPPMODE_4BPP                   (0x2 << 2)
> +#define WINCON0_BPPMODE_8BPP_PALETTE           (0x3 << 2)
> +#define WINCON0_BPPMODE_16BPP_565              (0x5 << 2)
> +#define WINCON0_BPPMODE_16BPP_1555             (0x7 << 2)
> +#define WINCON0_BPPMODE_18BPP_666              (0x8 << 2)
> +#define WINCON0_BPPMODE_24BPP_888              (0xb << 2)
> +
> +#define WINCON1_BLD_PIX                                (1 << 6)
> +
> +#define WINCON1_ALPHA_SEL                      (1 << 1)
> +#define WINCON1_BPPMODE_MASK                   (0xf << 2)
> +#define WINCON1_BPPMODE_SHIFT                  (2)
> +#define WINCON1_BPPMODE_1BPP                   (0x0 << 2)
> +#define WINCON1_BPPMODE_2BPP                   (0x1 << 2)
> +#define WINCON1_BPPMODE_4BPP                   (0x2 << 2)
> +#define WINCON1_BPPMODE_8BPP_PALETTE           (0x3 << 2)
> +#define WINCON1_BPPMODE_8BPP_1232              (0x4 << 2)
> +#define WINCON1_BPPMODE_16BPP_565              (0x5 << 2)
> +#define WINCON1_BPPMODE_16BPP_A1555            (0x6 << 2)
> +#define WINCON1_BPPMODE_16BPP_I1555            (0x7 << 2)
> +#define WINCON1_BPPMODE_18BPP_666              (0x8 << 2)
> +#define WINCON1_BPPMODE_18BPP_A1665            (0x9 << 2)
> +#define WINCON1_BPPMODE_19BPP_A1666            (0xa << 2)
> +#define WINCON1_BPPMODE_24BPP_888              (0xb << 2)
> +#define WINCON1_BPPMODE_24BPP_A1887            (0xc << 2)
> +#define WINCON1_BPPMODE_25BPP_A1888            (0xd << 2)
> +#define WINCON1_BPPMODE_28BPP_A4888            (0xd << 2)
> +
> +/* S5PV210 */
> +#define SHADOWCON                              (0x34)
> +#define SHADOWCON_WINx_PROTECT(_win)           (1 << (10 + (_win)))
> +/* DMA channels (all windows) */
> +#define SHADOWCON_CHx_ENABLE(_win)             (1 << (_win))
> +/* Local input channels (windows 0-2) */
> +#define SHADOWCON_CHx_LOCAL_ENABLE(_win)       (1 << (5 + (_win)))
> +
> +#define VIDOSDxA_TOPLEFT_X_E(_x)               ((((_x) & 0x800) >> 11) <<
> 23)
> +#define VIDOSDxA_TOPLEFT_X_MASK                        (0x7ff << 11)
> +#define VIDOSDxA_TOPLEFT_X_SHIFT               (11)
> +#define VIDOSDxA_TOPLEFT_X_LIMIT               (0x7ff)
> +#define VIDOSDxA_TOPLEFT_X(_x)                 (((_x) & 0x7ff) << 11)
> +
> +#define VIDOSDxA_TOPLEFT_Y_E(_x)               ((((_x) & 0x800) >> 11) <<
> 22)
> +#define VIDOSDxA_TOPLEFT_Y_MASK                        (0x7ff << 0)
> +#define VIDOSDxA_TOPLEFT_Y_SHIFT               (0)
> +#define VIDOSDxA_TOPLEFT_Y_LIMIT               (0x7ff)
> +#define VIDOSDxA_TOPLEFT_Y(_x)                 (((_x) & 0x7ff) << 0)
> +
> +#define VIDOSDxB_BOTRIGHT_X_E(_x)              ((((_x) & 0x800) >> 11) <<
> 23)
> +#define VIDOSDxB_BOTRIGHT_X_MASK               (0x7ff << 11)
> +#define VIDOSDxB_BOTRIGHT_X_SHIFT              (11)
> +#define VIDOSDxB_BOTRIGHT_X_LIMIT              (0x7ff)
> +#define VIDOSDxB_BOTRIGHT_X(_x)                        (((_x) & 0x7ff) <<
> 11)
> +
> +#define VIDOSDxB_BOTRIGHT_Y_E(_x)              ((((_x) & 0x800) >> 11) <<
> 22)
> +#define VIDOSDxB_BOTRIGHT_Y_MASK               (0x7ff << 0)
> +#define VIDOSDxB_BOTRIGHT_Y_SHIFT              (0)
> +#define VIDOSDxB_BOTRIGHT_Y_LIMIT              (0x7ff)
> +#define VIDOSDxB_BOTRIGHT_Y(_x)                        (((_x) & 0x7ff) <<
> 0)
> +
> +/* For VIDOSD[1..4]C */
> +#define VIDISD14C_ALPHA0_R(_x)                 ((_x) << 20)
> +#define VIDISD14C_ALPHA0_G_MASK                        (0xf << 16)
> +#define VIDISD14C_ALPHA0_G_SHIFT               (16)
> +#define VIDISD14C_ALPHA0_G_LIMIT               (0xf)
> +#define VIDISD14C_ALPHA0_G(_x)                 ((_x) << 16)
> +#define VIDISD14C_ALPHA0_B_MASK                        (0xf << 12)
> +#define VIDISD14C_ALPHA0_B_SHIFT               (12)
> +#define VIDISD14C_ALPHA0_B_LIMIT               (0xf)
> +#define VIDISD14C_ALPHA0_B(_x)                 ((_x) << 12)
> +#define VIDISD14C_ALPHA1_R_MASK                        (0xf << 8)
> +#define VIDISD14C_ALPHA1_R_SHIFT               (8)
> +#define VIDISD14C_ALPHA1_R_LIMIT               (0xf)
> +#define VIDISD14C_ALPHA1_R(_x)                 ((_x) << 8)
> +#define VIDISD14C_ALPHA1_G_MASK                        (0xf << 4)
> +#define VIDISD14C_ALPHA1_G_SHIFT               (4)
> +#define VIDISD14C_ALPHA1_G_LIMIT               (0xf)
> +#define VIDISD14C_ALPHA1_G(_x)                 ((_x) << 4)
> +#define VIDISD14C_ALPHA1_B_MASK                        (0xf << 0)
> +#define VIDISD14C_ALPHA1_B_SHIFT               (0)
> +#define VIDISD14C_ALPHA1_B_LIMIT               (0xf)
> +#define VIDISD14C_ALPHA1_B(_x)                 ((_x) << 0)
> +
> +/* Video buffer addresses */
> +#define VIDW_BUF_START(_buff)                  (0xA0 + ((_buff) * 8))
> +#define VIDW_BUF_START1(_buff)                 (0xA4 + ((_buff) * 8))
> +#define VIDW_BUF_END(_buff)                    (0xD0 + ((_buff) * 8))
> +#define VIDW_BUF_END1(_buff)                   (0xD4 + ((_buff) * 8))
> +#define VIDW_BUF_SIZE(_buff)                   (0x100 + ((_buff) * 4))
> +
> +#define VIDW_BUF_SIZE_OFFSET_E(_x)             ((((_x) & 0x2000) >> 13)
> << 27)
> +#define VIDW_BUF_SIZE_OFFSET_MASK              (0x1fff << 13)
> +#define VIDW_BUF_SIZE_OFFSET_SHIFT             (13)
> +#define VIDW_BUF_SIZE_OFFSET_LIMIT             (0x1fff)
> +#define VIDW_BUF_SIZE_OFFSET(_x)               (((_x) & 0x1fff) << 13)
> +
> +#define VIDW_BUF_SIZE_PAGEWIDTH_E(_x)          ((((_x) & 0x2000) >> 13)
> << 26)
> +#define VIDW_BUF_SIZE_PAGEWIDTH_MASK           (0x1fff << 0)
> +#define VIDW_BUF_SIZE_PAGEWIDTH_SHIFT          (0)
> +#define VIDW_BUF_SIZE_PAGEWIDTH_LIMIT          (0x1fff)
> +#define VIDW_BUF_SIZE_PAGEWIDTH(_x)            (((_x) & 0x1fff) << 0)
> +
> +/* Interrupt controls and status */
> +
> +#define VIDINTCON0_FIFOINTERVAL_MASK           (0x3f << 20)
> +#define VIDINTCON0_FIFOINTERVAL_SHIFT          (20)
> +#define VIDINTCON0_FIFOINTERVAL_LIMIT          (0x3f)
> +#define VIDINTCON0_FIFOINTERVAL(_x)            ((_x) << 20)
> +
> +#define VIDINTCON0_INT_SYSMAINCON              (1 << 19)
> +#define VIDINTCON0_INT_SYSSUBCON               (1 << 18)
> +#define VIDINTCON0_INT_I80IFDONE               (1 << 17)
> +
> +#define VIDINTCON0_FRAMESEL0_MASK              (0x3 << 15)
> +#define VIDINTCON0_FRAMESEL0_SHIFT             (15)
> +#define VIDINTCON0_FRAMESEL0_BACKPORCH         (0x0 << 15)
> +#define VIDINTCON0_FRAMESEL0_VSYNC             (0x1 << 15)
> +#define VIDINTCON0_FRAMESEL0_ACTIVE            (0x2 << 15)
> +#define VIDINTCON0_FRAMESEL0_FRONTPORCH                (0x3 << 15)
> +
> +#define VIDINTCON0_FRAMESEL1                   (1 << 13)
> +#define VIDINTCON0_FRAMESEL1_MASK              (0x3 << 13)
> +#define VIDINTCON0_FRAMESEL1_NONE              (0x0 << 13)
> +#define VIDINTCON0_FRAMESEL1_BACKPORCH         (0x1 << 13)
> +#define VIDINTCON0_FRAMESEL1_VSYNC             (0x2 << 13)
> +#define VIDINTCON0_FRAMESEL1_FRONTPORCH                (0x3 << 13)
> +
> +#define VIDINTCON0_INT_FRAME                   (1 << 12)
> +#define VIDINTCON0_FIFIOSEL_MASK               (0x7f << 5)
> +#define VIDINTCON0_FIFIOSEL_SHIFT              (5)
> +#define VIDINTCON0_FIFIOSEL_WINDOW0            (0x1 << 5)
> +#define VIDINTCON0_FIFIOSEL_WINDOW1            (0x2 << 5)
> +
> +#define VIDINTCON0_FIFOLEVEL_MASK              (0x7 << 2)
> +#define VIDINTCON0_FIFOLEVEL_SHIFT             (2)
> +#define VIDINTCON0_FIFOLEVEL_TO25PC            (0x0 << 2)
> +#define VIDINTCON0_FIFOLEVEL_TO50PC            (0x1 << 2)
> +#define VIDINTCON0_FIFOLEVEL_TO75PC            (0x2 << 2)
> +#define VIDINTCON0_FIFOLEVEL_EMPTY             (0x3 << 2)
> +#define VIDINTCON0_FIFOLEVEL_FULL              (0x4 << 2)
> +
> +#define VIDINTCON0_INT_FIFO_MASK               (0x3 << 0)
> +#define VIDINTCON0_INT_FIFO_SHIFT              (0)
> +#define VIDINTCON0_INT_ENABLE                  (1 << 0)
> +
> +#define VIDINTCON1                             (0x134)
> +#define VIDINTCON1_INT_I180                    (1 << 2)
> +#define VIDINTCON1_INT_FRAME                   (1 << 1)
> +#define VIDINTCON1_INT_FIFO                    (1 << 0)
> +
> +/* Window colour-key control registers */
> +#define WKEYCON                                        (0x140) /*
> 6410,V210 */
> +
> +#define WKEYCON0                               (0x00)
> +#define WKEYCON1                               (0x04)
> +
> +#define WxKEYCON0_KEYBL_EN                     (1 << 26)
> +#define WxKEYCON0_KEYEN_F                      (1 << 25)
> +#define WxKEYCON0_DIRCON                       (1 << 24)
> +#define WxKEYCON0_COMPKEY_MASK                 (0xffffff << 0)
> +#define WxKEYCON0_COMPKEY_SHIFT                        (0)
> +#define WxKEYCON0_COMPKEY_LIMIT                        (0xffffff)
> +#define WxKEYCON0_COMPKEY(_x)                  ((_x) << 0)
> +#define WxKEYCON1_COLVAL_MASK                  (0xffffff << 0)
> +#define WxKEYCON1_COLVAL_SHIFT                 (0)
> +#define WxKEYCON1_COLVAL_LIMIT                 (0xffffff)
> +#define WxKEYCON1_COLVAL(_x)                   ((_x) << 0)
> +
> +
> +/* Window blanking (MAP) */
> +
> +#define WINxMAP_MAP                            (1 << 24)
> +#define WINxMAP_MAP_COLOUR_MASK                        (0xffffff << 0)
> +#define WINxMAP_MAP_COLOUR_SHIFT               (0)
> +#define WINxMAP_MAP_COLOUR_LIMIT               (0xffffff)
> +#define WINxMAP_MAP_COLOUR(_x)                 ((_x) << 0)
> +
> +#define WPALCON_PAL_UPDATE                     (1 << 9)
> +#define WPALCON_W1PAL_MASK                     (0x7 << 3)
> +#define WPALCON_W1PAL_SHIFT                    (3)
> +#define WPALCON_W1PAL_25BPP_A888               (0x0 << 3)
> +#define WPALCON_W1PAL_24BPP                    (0x1 << 3)
> +#define WPALCON_W1PAL_19BPP_A666               (0x2 << 3)
> +#define WPALCON_W1PAL_18BPP_A665               (0x3 << 3)
> +#define WPALCON_W1PAL_18BPP                    (0x4 << 3)
> +#define WPALCON_W1PAL_16BPP_A555               (0x5 << 3)
> +#define WPALCON_W1PAL_16BPP_565                        (0x6 << 3)
> +
> +#define WPALCON_W0PAL_MASK                     (0x7 << 0)
> +#define WPALCON_W0PAL_SHIFT                    (0)
> +#define WPALCON_W0PAL_25BPP_A888               (0x0 << 0)
> +#define WPALCON_W0PAL_24BPP                    (0x1 << 0)
> +#define WPALCON_W0PAL_19BPP_A666               (0x2 << 0)
> +#define WPALCON_W0PAL_18BPP_A665               (0x3 << 0)
> +#define WPALCON_W0PAL_18BPP                    (0x4 << 0)
> +#define WPALCON_W0PAL_16BPP_A555               (0x5 << 0)
> +#define WPALCON_W0PAL_16BPP_565                        (0x6 << 0)
> +
> +/* Blending equation control */
> +#define BLENDCON                               (0x260)
> +#define BLENDCON_NEW_MASK                      (1 << 0)
> +#define BLENDCON_NEW_8BIT_ALPHA_VALUE          (1 << 0)
> +#define BLENDCON_NEW_4BIT_ALPHA_VALUE          (0 << 0)
> +
> +#define S3C_FB_MAX_WIN (5)  /* number of hardware windows available. */
> +#define VIDCON1_FSTATUS_EVEN   (1 << 15)
> +
> +/* Video timing controls */
> +#define VIDTCON0                               (0x10)
> +#define VIDTCON1                               (0x14)
> +#define VIDTCON2                               (0x18)
> +
> +/* Window position controls */
> +
> +#define WINCON(_win)                           (0x20 + ((_win) * 4))
> +
> +/* OSD1 and OSD4 do not have register D */
> +
> +#define VIDOSD_BASE                            (0x40)
> +
> +#define VIDINTCON0                             (0x130)
> +
> +/* WINCONx */
> +
> +#define WINCONx_CSCWIDTH_MASK                  (0x3 << 26)
> +#define WINCONx_CSCWIDTH_SHIFT                 (26)
> +#define WINCONx_CSCWIDTH_WIDE                  (0x0 << 26)
> +#define WINCONx_CSCWIDTH_NARROW                        (0x3 << 26)
> +
> +#define WINCONx_ENLOCAL                                (1 << 22)
> +#define WINCONx_BUFSTATUS                      (1 << 21)
> +#define WINCONx_BUFSEL                         (1 << 20)
> +#define WINCONx_BUFAUTOEN                      (1 << 19)
> +#define WINCONx_YCbCr                          (1 << 13)
> +
> +#define WINCON1_LOCALSEL_CAMIF                 (1 << 23)
> +
> +#define WINCON2_LOCALSEL_CAMIF                 (1 << 23)
> +#define WINCON2_BLD_PIX                                (1 << 6)
> +
> +#define WINCON2_ALPHA_SEL                      (1 << 1)
> +#define WINCON2_BPPMODE_MASK                   (0xf << 2)
> +#define WINCON2_BPPMODE_SHIFT                  (2)
> +#define WINCON2_BPPMODE_1BPP                   (0x0 << 2)
> +#define WINCON2_BPPMODE_2BPP                   (0x1 << 2)
> +#define WINCON2_BPPMODE_4BPP                   (0x2 << 2)
> +#define WINCON2_BPPMODE_8BPP_1232              (0x4 << 2)
> +#define WINCON2_BPPMODE_16BPP_565              (0x5 << 2)
> +#define WINCON2_BPPMODE_16BPP_A1555            (0x6 << 2)
> +#define WINCON2_BPPMODE_16BPP_I1555            (0x7 << 2)
> +#define WINCON2_BPPMODE_18BPP_666              (0x8 << 2)
> +#define WINCON2_BPPMODE_18BPP_A1665            (0x9 << 2)
> +#define WINCON2_BPPMODE_19BPP_A1666            (0xa << 2)
> +#define WINCON2_BPPMODE_24BPP_888              (0xb << 2)
> +#define WINCON2_BPPMODE_24BPP_A1887            (0xc << 2)
> +#define WINCON2_BPPMODE_25BPP_A1888            (0xd << 2)
> +#define WINCON2_BPPMODE_28BPP_A4888            (0xd << 2)
> +
> +#define WINCON3_BLD_PIX                                (1 << 6)
> +
> +#define WINCON3_ALPHA_SEL                      (1 << 1)
> +#define WINCON3_BPPMODE_MASK                   (0xf << 2)
> +#define WINCON3_BPPMODE_SHIFT                  (2)
> +#define WINCON3_BPPMODE_1BPP                   (0x0 << 2)
> +#define WINCON3_BPPMODE_2BPP                   (0x1 << 2)
> +#define WINCON3_BPPMODE_4BPP                   (0x2 << 2)
> +#define WINCON3_BPPMODE_16BPP_565              (0x5 << 2)
> +#define WINCON3_BPPMODE_16BPP_A1555            (0x6 << 2)
> +#define WINCON3_BPPMODE_16BPP_I1555            (0x7 << 2)
> +#define WINCON3_BPPMODE_18BPP_666              (0x8 << 2)
> +#define WINCON3_BPPMODE_18BPP_A1665            (0x9 << 2)
> +#define WINCON3_BPPMODE_19BPP_A1666            (0xa << 2)
> +#define WINCON3_BPPMODE_24BPP_888              (0xb << 2)
> +#define WINCON3_BPPMODE_24BPP_A1887            (0xc << 2)
> +#define WINCON3_BPPMODE_25BPP_A1888            (0xd << 2)
> +#define WINCON3_BPPMODE_28BPP_A4888            (0xd << 2)
> +
> +#define VIDINTCON0_FIFIOSEL_WINDOW2            (0x10 << 5)
> +#define VIDINTCON0_FIFIOSEL_WINDOW3            (0x20 << 5)
> +#define VIDINTCON0_FIFIOSEL_WINDOW4            (0x40 << 5)
> +
> +#define DITHMODE                               (0x170)
> +#define WINxMAP(_win)                          (0x180 + ((_win) * 4))
> +
> +
> +#define DITHMODE_R_POS_MASK                    (0x3 << 5)
> +#define DITHMODE_R_POS_SHIFT                   (5)
> +#define DITHMODE_R_POS_8BIT                    (0x0 << 5)
> +#define DITHMODE_R_POS_6BIT                    (0x1 << 5)
> +#define DITHMODE_R_POS_5BIT                    (0x2 << 5)
> +
> +#define DITHMODE_G_POS_MASK                    (0x3 << 3)
> +#define DITHMODE_G_POS_SHIFT                   (3)
> +#define DITHMODE_G_POS_8BIT                    (0x0 << 3)
> +#define DITHMODE_G_POS_6BIT                    (0x1 << 3)
> +#define DITHMODE_G_POS_5BIT                    (0x2 << 3)
> +
> +#define DITHMODE_B_POS_MASK                    (0x3 << 1)
> +#define DITHMODE_B_POS_SHIFT                   (1)
> +#define DITHMODE_B_POS_8BIT                    (0x0 << 1)
> +#define DITHMODE_B_POS_6BIT                    (0x1 << 1)
> +#define DITHMODE_B_POS_5BIT                    (0x2 << 1)
> +
> +#define DITHMODE_DITH_EN                       (1 << 0)
> +
> +#define WPALCON                                        (0x1A0)
> +
> +/* Palette control */
> +/* Note for S5PC100: you can still use those macros on WPALCON (aka
> WPALCON_L),
> + * but make sure that WPALCON_H W2PAL-W4PAL entries are zeroed out */
> +#define WPALCON_W4PAL_16BPP_A555               (1 << 8)
> +#define WPALCON_W3PAL_16BPP_A555               (1 << 7)
> +#define WPALCON_W2PAL_16BPP_A555               (1 << 6)
> +
> +
> +/* Notes on per-window bpp settings
> + *
> + * Value       Win0     Win1     Win2     Win3     Win 4
> + * 0000                1(P)     1(P)     1(P)     1(P)     1(P)
> + * 0001                2(P)     2(P)     2(P)     2(P)     2(P)
> + * 0010                4(P)     4(P)     4(P)     4(P)     -none-
> + * 0011                8(P)     8(P)     -none-   -none-   -none-
> + * 0100                -none-   8(A232)  8(A232)  -none-   -none-
> + * 0101                16(565)  16(565)  16(565)  16(565)   16(565)
> + * 0110                -none-   16(A555) 16(A555) 16(A555)  16(A555)
> + * 0111                16(I555) 16(I565) 16(I555) 16(I555)  16(I555)
> + * 1000                18(666)  18(666)  18(666)  18(666)   18(666)
> + * 1001                -none-   18(A665) 18(A665) 18(A665)  16(A665)
> + * 1010                -none-   19(A666) 19(A666) 19(A666)  19(A666)
> + * 1011                24(888)  24(888)  24(888)  24(888)   24(888)
> + * 1100                -none-   24(A887) 24(A887) 24(A887)  24(A887)
> + * 1101                -none-   25(A888) 25(A888) 25(A888)  25(A888)
> + * 1110                -none-   -none-   -none-   -none-    -none-
> + * 1111                -none-   -none-   -none-   -none-    -none-
> +*/
> +
> +/*FIMD V8 REG OFFSET */
> +#define FIMD_V8_VIDTCON0       (0x20010)
> +#define FIMD_V8_VIDTCON1       (0x20014)
> +#define FIMD_V8_VIDTCON2       (0x20018)
> +#define FIMD_V8_VIDTCON3       (0x2001C)
> +#define FIMD_V8_VIDCON1                (0x20004)
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--bcaec520e91160220104c6081a8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adding Marek.<br><br>
<div class=3D"gmail_quote">On Mon, Jul 30, 2012 at 2:15 PM, Leela Krishna A=
mudala <span dir=3D"ltr">&lt;<a href=3D"mailto:l.krishna@samsung.com" targe=
t=3D"_blank">l.krishna@samsung.com</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">Moved the contents of regs-fb-v4.h an=
d regs-fb.h from arch side<br>to include/video/samsung_fimd.h<br><br>Signed=
-off-by: Leela Krishna Amudala &lt;<a href=3D"mailto:l.krishna@samsung.com"=
>l.krishna@samsung.com</a>&gt;<br>

---<br>=A0arch/arm/plat-samsung/include/plat/regs-fb-v4.h | =A0159 -------<=
br>=A0arch/arm/plat-samsung/include/plat/regs-fb.h =A0 =A0| =A0403 --------=
---------<br>=A0include/video/samsung_fimd.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0533 +++++++++++++++++++++++<br>

=A03 files changed, 533 insertions(+), 562 deletions(-)<br>=A0delete mode 1=
00644 arch/arm/plat-samsung/include/plat/regs-fb-v4.h<br>=A0delete mode 100=
644 arch/arm/plat-samsung/include/plat/regs-fb.h<br>=A0create mode 100644 i=
nclude/video/samsung_fimd.h<br>

<br>diff --git a/arch/arm/plat-samsung/include/plat/regs-fb-v4.h b/arch/arm=
/plat-samsung/include/plat/regs-fb-v4.h<br>deleted file mode 100644<br>inde=
x 4c3647f..0000000<br>--- a/arch/arm/plat-samsung/include/plat/regs-fb-v4.h=
<br>

+++ /dev/null<br>@@ -1,159 +0,0 @@<br>-/* arch/arm/plat-samsung/include/pla=
t/regs-fb-v4.h<br>- *<br>- * Copyright 2008 Openmoko, Inc.<br>- * Copyright=
 2008 Simtec Electronics<br>- * =A0 =A0 =A0<a href=3D"http://armlinux.simte=
c.co.uk/" target=3D"_blank">http://armlinux.simtec.co.uk/</a><br>

- * =A0 =A0 =A0Ben Dooks &lt;<a href=3D"mailto:ben@simtec.co.uk">ben@simtec=
.co.uk</a>&gt;<br>- *<br>- * S3C64XX - new-style framebuffer register defin=
itions<br>- *<br>- * This is the register set for the new style framebuffer=
 interface<br>

- * found from the S3C2443 onwards and specifically the S3C64XX series<br>-=
 * S3C6400 and S3C6410.<br>- *<br>- * The file contains the cpu specific it=
ems which change between whichever<br>- * architecture is selected. See &lt=
;plat/regs-fb.h&gt; for the core definitions<br>

- * that are the same.<br>- *<br>- * This program is free software; you can=
 redistribute it and/or modify<br>- * it under the terms of the GNU General=
 Public License version 2 as<br>- * published by the Free Software Foundati=
on.<br>

-*/<br>-<br>-/* include the core definitions here, in case we really do nee=
d to<br>- * override them at a later date.<br>-*/<br>-<br>-#include &lt;pla=
t/regs-fb.h&gt;<br>-<br>-#define S3C_FB_MAX_WIN (5) =A0/* number of hardwar=
e windows available. */<br>

-#define VIDCON1_FSTATUS_EVEN =A0 (1 &lt;&lt; 15)<br>-<br>-/* Video timing =
controls */<br>-#define VIDTCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0x10)<br>-#define VIDTCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x14)<br>-#define VIDTCON2 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x18)<br>

-<br>-/* Window position controls */<br>-<br>-#define WINCON(_win) =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x20 + ((_win) * 4))<br>-<br>-=
/* OSD1 and OSD4 do not have register D */<br>-<br>-#define VIDOSD_BASE =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x40)<br>

-<br>-#define VIDINTCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x130)<br>-<br>-/* WINCONx */<br>-<br>-#define WINCONx_CSCWIDTH_MA=
SK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 26)<br>-#define WINCONx=
_CSCWIDTH_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (26)<br>-#define WINCONx_CS=
CWIDTH_WIDE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 26)<br>

-#define WINCONx_CSCWIDTH_NARROW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x3 &lt;&lt; 26)<br>-<br>-#define WINCONx_ENLOCAL =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 22)<br>-#define =
WINCONx_BUFSTATUS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 21=
)<br>

-#define WINCONx_BUFSEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; 20)<br>-#define WINCONx_BUFAUTOEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(1 &lt;&lt; 19)<br>-#define WINCONx_YCbCr =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 13)<br>-<br>-#define WINCON1_LOC=
ALSEL_CAMIF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 23)<br>

-<br>-#define WINCON2_LOCALSEL_CAMIF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt=
;&lt; 23)<br>-#define WINCON2_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>-<br>-#define WINCON2_ALPHA_SE=
L =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>-#define WIN=
CON2_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

-#define WINCON2_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>-#=
define WINCON2_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>-#define WINCON2_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>-#define WINCON2_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

-#define WINCON2_BPPMODE_8BPP_1232 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt;&lt;=
 2)<br>-#define WINCON2_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x5 &=
lt;&lt; 2)<br>-#define WINCON2_BPPMODE_16BPP_A1555 =A0 =A0 =A0 =A0 =A0 =A0(=
0x6 &lt;&lt; 2)<br>-#define WINCON2_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0=
 =A0(0x7 &lt;&lt; 2)<br>

-#define WINCON2_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt;&lt;=
 2)<br>-#define WINCON2_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x9 &lt=
;&lt; 2)<br>-#define WINCON2_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =A0(0x=
a &lt;&lt; 2)<br>-#define WINCON2_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0xb &lt;&lt; 2)<br>

-#define WINCON2_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt;&lt; 2=
)<br>-#define WINCON2_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0xd &lt;&=
lt; 2)<br>-#define WINCON2_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =A0(0xd =
&lt;&lt; 2)<br>-<br>-#define WINCON3_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>

-<br>-#define WINCON3_ALPHA_SEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 &lt;&lt; 1)<br>-#define WINCON3_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (0xf &lt;&lt; 2)<br>-#define WINCON3_BPPMODE_SHIFT =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(2)<br>-#define WINCON3_BPPMODE_1BPP =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0x0 &lt;&lt; 2)<br>

-#define WINCON3_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;=
&lt; 2)<br>-#define WINCON3_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x2 &lt;&lt; 2)<br>-#define WINCON3_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x5 &lt;&lt; 2)<br>-#define WINCON3_BPPMODE_16BPP_A1555 =A0 =A0=
 =A0 =A0 =A0 =A0(0x6 &lt;&lt; 2)<br>

-#define WINCON3_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0 =A0(0x7 &lt;&lt; 2=
)<br>-#define WINCON3_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt=
;&lt; 2)<br>-#define WINCON3_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x=
9 &lt;&lt; 2)<br>-#define WINCON3_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =
=A0(0xa &lt;&lt; 2)<br>

-#define WINCON3_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>-#define WINCON3_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt=
;&lt; 2)<br>-#define WINCON3_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0x=
d &lt;&lt; 2)<br>-#define WINCON3_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =
=A0(0xd &lt;&lt; 2)<br>

-<br>-#define VIDINTCON0_FIFIOSEL_WINDOW2 =A0 =A0 =A0 =A0 =A0 =A0(0x10 &lt;=
&lt; 5)<br>-#define VIDINTCON0_FIFIOSEL_WINDOW3 =A0 =A0 =A0 =A0 =A0 =A0(0x2=
0 &lt;&lt; 5)<br>-#define VIDINTCON0_FIFIOSEL_WINDOW4 =A0 =A0 =A0 =A0 =A0 =
=A0(0x40 &lt;&lt; 5)<br>-<br>-#define DITHMODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x170)<br>

-#define WINxMAP(_win) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
0x180 + ((_win) * 4))<br>-<br>-<br>-#define DITHMODE_R_POS_MASK =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 5)<br>-#define DITHMODE_R_POS_SHI=
FT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (5)<br>-#define DITHMODE_R_POS_8BIT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 5)<br>

-#define DITHMODE_R_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &l=
t;&lt; 5)<br>-#define DITHMODE_R_POS_5BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x2 &lt;&lt; 5)<br>-<br>-#define DITHMODE_G_POS_MASK =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 3)<br>-#define DITHMODE_G_POS_SHIF=
T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (3)<br>

-#define DITHMODE_G_POS_8BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &l=
t;&lt; 3)<br>-#define DITHMODE_G_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x1 &lt;&lt; 3)<br>-#define DITHMODE_G_POS_5BIT =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 3)<br>-<br>-#define DITHMODE_B_POS_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 1)<br>

-#define DITHMODE_B_POS_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1)<br>-#=
define DITHMODE_B_POS_8BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;=
&lt; 1)<br>-#define DITHMODE_B_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0x1 &lt;&lt; 1)<br>-#define DITHMODE_B_POS_5BIT =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 1)<br>

-<br>-#define DITHMODE_DITH_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(1 &lt;&lt; 0)<br>-<br>-#define WPALCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1A0)<br>-<br>-/* Palette con=
trol */<br>-/* Note for S5PC100: you can still use those macros on WPALCON =
(aka WPALCON_L),<br>

- * but make sure that WPALCON_H W2PAL-W4PAL entries are zeroed out */<br>-=
#define WPALCON_W4PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 8)=
<br>-#define WPALCON_W3PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&l=
t; 7)<br>-#define WPALCON_W2PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &=
lt;&lt; 6)<br>

-<br>-<br>-/* Notes on per-window bpp settings<br>- *<br>- * Value =A0 =A0 =
=A0 Win0 =A0 =A0 Win1 =A0 =A0 Win2 =A0 =A0 Win3 =A0 =A0 Win 4<br>- * 0000 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01(P) =A0 =A0 1(P) =A0 =A0 1(P) =A0 =A0 1(P) =
=A0 =A0 1(P)<br>- * 0001 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02(P) =A0 =A0 2(P) =
=A0 =A0 2(P) =A0 =A0 2(P) =A0 =A0 2(P)<br>

- * 0010 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04(P) =A0 =A0 4(P) =A0 =A0 4(P) =A0 =
=A0 4(P) =A0 =A0 -none-<br>- * 0011 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08(P) =A0=
 =A0 8(P) =A0 =A0 -none- =A0 -none- =A0 -none-<br>- * 0100 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0-none- =A0 8(A232) =A08(A232) =A0-none- =A0 -none-<br>- * 01=
01 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A016(565) =A016(565) =A016(565) =A016(565) =
=A0 16(565)<br>

- * 0110 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 16(A555) 16(A555) 16(A55=
5) =A016(A555)<br>- * 0111 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A016(I555) 16(I565)=
 16(I555) 16(I555) =A016(I555)<br>- * 1000 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01=
8(666) =A018(666) =A018(666) =A018(666) =A0 18(666)<br>- * 1001 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0-none- =A0 18(A665) 18(A665) 18(A665) =A016(A665)<br>

- * 1010 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 19(A666) 19(A666) 19(A66=
6) =A019(A666)<br>- * 1011 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A024(888) =A024(888=
) =A024(888) =A024(888) =A0 24(888)<br>- * 1100 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0-none- =A0 24(A887) 24(A887) 24(A887) =A024(A887)<br>- * 1101 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0-none- =A0 25(A888) 25(A888) 25(A888) =A025(A888)<br=
>

- * 1110 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 -none- =A0 -none- =A0 -n=
one- =A0 =A0-none-<br>- * 1111 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 -n=
one- =A0 -none- =A0 -none- =A0 =A0-none-<br>-*/<br>diff --git a/arch/arm/pl=
at-samsung/include/plat/regs-fb.h b/arch/arm/plat-samsung/include/plat/regs=
-fb.h<br>

deleted file mode 100644<br>index 9a78012..0000000<br>--- a/arch/arm/plat-s=
amsung/include/plat/regs-fb.h<br>+++ /dev/null<br>@@ -1,403 +0,0 @@<br>-/* =
arch/arm/plat-samsung/include/plat/regs-fb.h<br>- *<br>- * Copyright 2008 O=
penmoko, Inc.<br>

- * Copyright 2008 Simtec Electronics<br>- * =A0 =A0 =A0<a href=3D"http://a=
rmlinux.simtec.co.uk/" target=3D"_blank">http://armlinux.simtec.co.uk/</a><=
br>- * =A0 =A0 =A0Ben Dooks &lt;<a href=3D"mailto:ben@simtec.co.uk">ben@sim=
tec.co.uk</a>&gt;<br>

- *<br>- * S3C Platform - new-style framebuffer register definitions<br>- *=
<br>- * This is the register set for the new style framebuffer interface<br=
>- * found from the S3C2443 onwards into the S3C2416, S3C2450 and the<br>

- * S3C64XX series such as the S3C6400 and S3C6410.<br>- *<br>- * The file =
does not contain the cpu specific items which are based on<br>- * whichever=
 architecture is selected, it only contains the core of the<br>- * register=
 set. See &lt;mach/regs-fb.h&gt; to get the specifics.<br>

- *<br>- * Note, we changed to using regs-fb.h as it avoids any clashes wit=
h<br>- * the original regs-lcd.h so out of the way of regs-lcd.h as well as=
<br>- * indicating the newer block is much more than just an LCD interface.=
<br>

- *<br>- * This program is free software; you can redistribute it and/or mo=
dify<br>- * it under the terms of the GNU General Public License version 2 =
as<br>- * published by the Free Software Foundation.<br>-*/<br>-<br>-/* Ple=
ase do not include this file directly, use &lt;mach/regs-fb.h&gt; to<br>

- * ensure all the localised SoC support is included as necessary.<br>-*/<b=
r>-<br>-/* VIDCON0 */<br>-<br>-#define VIDCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x00)<br>-#define VIDCO=
N0_INTERLACE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 29)<br>

-#define VIDCON0_VIDOUT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &l=
t;&lt; 26)<br>-#define VIDCON0_VIDOUT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (26)<br>-#define VIDCON0_VIDOUT_RGB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x0 &lt;&lt; 26)<br>-#define VIDCON0_VIDOUT_TV =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 26)<br>

-#define VIDCON0_VIDOUT_I80_LDI0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x2 &lt;&lt; 26)<br>-#define VIDCON0_VIDOUT_I80_LDI1 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 26)<br>-<br>-#define VIDCO=
N0_L1_DATA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7 &lt;&lt; 23)<br>

-#define VIDCON0_L1_DATA_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(23)<br>-=
#define VIDCON0_L1_DATA_16BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&=
lt; 23)<br>-#define VIDCON0_L1_DATA_18BPP16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 23)<br>-#define VIDCON0_L1_DATA_18BPP9 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt; 23)<br>

-#define VIDCON0_L1_DATA_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;=
&lt; 23)<br>-#define VIDCON0_L1_DATA_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x4 &lt;&lt; 23)<br>-#define VIDCON0_L1_DATA_16BPP8 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 (0x5 &lt;&lt; 23)<br>-<br>-#define VIDCON0_L0_DATA_MASK =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7 &lt;&lt; 20)<br>

-#define VIDCON0_L0_DATA_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(20)<br>-=
#define VIDCON0_L0_DATA_16BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&=
lt; 20)<br>-#define VIDCON0_L0_DATA_18BPP16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 20)<br>-#define VIDCON0_L0_DATA_18BPP9 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt; 20)<br>

-#define VIDCON0_L0_DATA_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;=
&lt; 20)<br>-#define VIDCON0_L0_DATA_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x4 &lt;&lt; 20)<br>-#define VIDCON0_L0_DATA_16BPP8 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 (0x5 &lt;&lt; 20)<br>-<br>-#define VIDCON0_PNRMODE_MASK =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 17)<br>

-#define VIDCON0_PNRMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(17)<br>-=
#define VIDCON0_PNRMODE_RGB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt=
;&lt; 17)<br>-#define VIDCON0_PNRMODE_BGR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x1 &lt;&lt; 17)<br>-#define VIDCON0_PNRMODE_SERIAL_RGB =A0 =A0 =A0=
 =A0 =A0 =A0 (0x2 &lt;&lt; 17)<br>

-#define VIDCON0_PNRMODE_SERIAL_BGR =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 1=
7)<br>-<br>-#define VIDCON0_CLKVALUP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (1 &lt;&lt; 16)<br>-#define VIDCON0_CLKVAL_F_MASK =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 6)<br>-#define VIDCON0_CLKVAL_F_SHIFT =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (6)<br>

-#define VIDCON0_CLKVAL_F_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br>-=
#define VIDCON0_CLKVAL_F(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;=
&lt; 6)<br>-#define VIDCON0_VLCKFREE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (1 &lt;&lt; 5)<br>-#define VIDCON0_CLKDIR =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 4)<br>

-<br>-#define VIDCON0_CLKSEL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0=
x3 &lt;&lt; 2)<br>-#define VIDCON0_CLKSEL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (2)<br>-#define VIDCON0_CLKSEL_HCLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x0 &lt;&lt; 2)<br>-#define VIDCON0_CLKSEL_LCD =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt; 2)<br>

-#define VIDCON0_CLKSEL_27M =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &l=
t;&lt; 2)<br>-<br>-#define VIDCON0_ENVID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>-#define VIDCON0_ENVID_F =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br>-<br>-=
#define VIDCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(0x04)<br>

-#define VIDCON1_LINECNT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &l=
t;&lt; 16)<br>-#define VIDCON1_LINECNT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(16)<br>-#define VIDCON1_LINECNT_GET(_v) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(((_v) &gt;&gt; 16) &amp; 0x7ff)<br>-#define VIDCON1_VS=
TATUS_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 13)<br>

-#define VIDCON1_VSTATUS_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(13)<br>-=
#define VIDCON1_VSTATUS_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&=
lt; 13)<br>-#define VIDCON1_VSTATUS_BACKPORCH =A0 =A0 =A0 =A0 =A0 =A0 =A0(0=
x1 &lt;&lt; 13)<br>-#define VIDCON1_VSTATUS_ACTIVE =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x2 &lt;&lt; 13)<br>

-#define VIDCON1_VSTATUS_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&lt; 1=
3)<br>-#define VIDCON1_VCLK_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 9)<br>-#define VIDCON1_VCLK_HOLD =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 9)<br>-#define VIDCON1_VCLK_RUN =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt; 9)<br>

-<br>-#define VIDCON1_INV_VCLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(1 &lt;&lt; 7)<br>-#define VIDCON1_INV_HSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>-#define VIDCON1_INV_VSYNC =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 5)<br>-#define VIDCON1_INV_VDEN =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 4)<br>

-<br>-/* VIDCON2 */<br>-<br>-#define VIDCON2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x08)<br>-#define VIDCO=
N2_EN601 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 23)=
<br>-#define VIDCON2_TVFMTSEL_SW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 =
&lt;&lt; 14)<br>

-<br>-#define VIDCON2_TVFMTSEL1_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &=
lt;&lt; 12)<br>-#define VIDCON2_TVFMTSEL1_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(12)<br>-#define VIDCON2_TVFMTSEL1_RGB =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 12)<br>-#define VIDCON2_TVFMTSEL1_YUV422 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt; 12)<br>

-#define VIDCON2_TVFMTSEL1_YUV444 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt;=
 12)<br>-<br>-#define VIDCON2_ORGYCbCr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (1 &lt;&lt; 8)<br>-#define VIDCON2_YUVORDCrCb =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 7)<br>-<br>-/* PRTCON (S3C6410, S5PC100)<br=
>

- * Might not be present in the S3C6410 documentation,<br>- * but tests pro=
ve it&#39;s there almost for sure; shouldn&#39;t hurt in any case.<br>- */<=
br>-#define PRTCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x0c)<br>-#define PRTCON_PROTECT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (1 &lt;&lt; 11)<br>

-<br>-/* VIDTCON0 */<br>-<br>-#define VIDTCON0_VBPDE_MASK =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 24)<br>-#define VIDTCON0_VBPDE_SHIFT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (24)<br>-#define VIDTCON0_VBPDE_LIMIT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br>-#define VIDTCON0_VBPDE(_x) =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;&lt; 24)<br>

-<br>-#define VIDTCON0_VBPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 16)<br>-#define VIDTCON0_VBPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(16)<br>-#define VIDTCON0_VBPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0(0xff)<br>-#define VIDTCON0_VBPD(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 16)<br>

-<br>-#define VIDTCON0_VFPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 8)<br>-#define VIDTCON0_VFPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(8)<br>-#define VIDTCON0_VFPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0xff)<br>-#define VIDTCON0_VFPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 8)<br>

-<br>-#define VIDTCON0_VSPW_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 0)<br>-#define VIDTCON0_VSPW_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0)<br>-#define VIDTCON0_VSPW_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0xff)<br>-#define VIDTCON0_VSPW(_x) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 0)<br>

-<br>-/* VIDTCON1 */<br>-<br>-#define VIDTCON1_VFPDE_MASK =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 24)<br>-#define VIDTCON1_VFPDE_SHIFT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (24)<br>-#define VIDTCON1_VFPDE_LIMIT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br>-#define VIDTCON1_VFPDE(_x) =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;&lt; 24)<br>

-<br>-#define VIDTCON1_HBPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 16)<br>-#define VIDTCON1_HBPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(16)<br>-#define VIDTCON1_HBPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0(0xff)<br>-#define VIDTCON1_HBPD(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 16)<br>

-<br>-#define VIDTCON1_HFPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 8)<br>-#define VIDTCON1_HFPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(8)<br>-#define VIDTCON1_HFPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0xff)<br>-#define VIDTCON1_HFPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 8)<br>

-<br>-#define VIDTCON1_HSPW_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
xff &lt;&lt; 0)<br>-#define VIDTCON1_HSPW_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0)<br>-#define VIDTCON1_HSPW_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0xff)<br>-#define VIDTCON1_HSPW(_x) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 0)<br>

-<br>-#define VIDTCON2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x18)<br>-#define VIDTCON2_LINEVAL_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ((((_x) &amp; 0x800) &gt;&gt; 11) &lt;&lt; 23)<br>-#define VIDTCON2=
_LINEVAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff &lt;&lt; 11)<br>

-#define VIDTCON2_LINEVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (11)<br>-#d=
efine VIDTCON2_LINEVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff)<br>-#d=
efine VIDTCON2_LINEVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &amp;=
 0x7ff) &lt;&lt; 11)<br>-<br>-#define VIDTCON2_HOZVAL_E(_x) =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0((((_x) &amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>

-#define VIDTCON2_HOZVAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &l=
t;&lt; 0)<br>-#define VIDTCON2_HOZVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0)<br>-#define VIDTCON2_HOZVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x7ff)<br>-#define VIDTCON2_HOZVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(((_x) &amp; 0x7ff) &lt;&lt; 0)<br>

-<br>-/* WINCONx */<br>-<br>-<br>-#define WINCONx_BITSWP =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 18)<br>-#define WINCONx_BYTSWP =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 17)<br>-#define=
 WINCONx_HAWSWP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt;=
 16)<br>

-#define WINCONx_WSWP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1 &lt;&lt; 15)<br>-#define WINCONx_BURSTLEN_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 &lt;&lt; 9)<br>-#define WINCONx_BURSTLEN_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (9)<br>-#define WINCONx_BURSTLEN_16WORD =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 9)<br>

-#define WINCONx_BURSTLEN_8WORD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&l=
t; 9)<br>-#define WINCONx_BURSTLEN_4WORD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
x2 &lt;&lt; 9)<br>-<br>-#define WINCONx_ENWIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br>-#define WINCON0_BPPMODE_MASK =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

-#define WINCON0_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>-#=
define WINCON0_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>-#define WINCON0_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>-#define WINCON0_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

-#define WINCON0_BPPMODE_8BPP_PALETTE =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2)<=
br>-#define WINCON0_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x5 &lt;&=
lt; 2)<br>-#define WINCON0_BPPMODE_16BPP_1555 =A0 =A0 =A0 =A0 =A0 =A0 (0x7 =
&lt;&lt; 2)<br>-#define WINCON0_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x8 &lt;&lt; 2)<br>

-#define WINCON0_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>-<br>-#define WINCON1_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>-<br>-#define WINCON1_ALPHA_SE=
L =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>-#define WIN=
CON1_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

-#define WINCON1_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>-#=
define WINCON1_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>-#define WINCON1_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>-#define WINCON1_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

-#define WINCON1_BPPMODE_8BPP_PALETTE =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2)<=
br>-#define WINCON1_BPPMODE_8BPP_1232 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt;&=
lt; 2)<br>-#define WINCON1_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x=
5 &lt;&lt; 2)<br>-#define WINCON1_BPPMODE_16BPP_A1555 =A0 =A0 =A0 =A0 =A0 =
=A0(0x6 &lt;&lt; 2)<br>

-#define WINCON1_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0 =A0(0x7 &lt;&lt; 2=
)<br>-#define WINCON1_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt=
;&lt; 2)<br>-#define WINCON1_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x=
9 &lt;&lt; 2)<br>-#define WINCON1_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =
=A0(0xa &lt;&lt; 2)<br>

-#define WINCON1_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>-#define WINCON1_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt=
;&lt; 2)<br>-#define WINCON1_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0x=
d &lt;&lt; 2)<br>-#define WINCON1_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =
=A0(0xd &lt;&lt; 2)<br>

-<br>-/* S5PV210 */<br>-#define SHADOWCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x34)<br>-#define SHADOWCON_WINx_PROTECT(_win) =
=A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; (10 + (_win)))<br>-/* DMA channels (all win=
dows) */<br>-#define SHADOWCON_CHx_ENABLE(_win) =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; (_win))<br>

-/* Local input channels (windows 0-2) */<br>-#define SHADOWCON_CHx_LOCAL_E=
NABLE(_win) =A0 =A0 =A0 (1 &lt;&lt; (5 + (_win)))<br>-<br>-#define VIDOSDxA=
_TOPLEFT_X_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) &amp; 0x800) &gt;&gt; =
11) &lt;&lt; 23)<br>

-#define VIDOSDxA_TOPLEFT_X_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x7ff &lt;&lt; 11)<br>-#define VIDOSDxA_TOPLEFT_X_SHIFT =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 (11)<br>-#define VIDOSDxA_TOPLEFT_X_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x7ff)<br>-#define VIDOSDxA_TOPLEFT_X(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (((_x) &amp; 0x7ff) &lt;&lt; 11)<br>

-<br>-#define VIDOSDxA_TOPLEFT_Y_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) =
&amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>-#define VIDOSDxA_TOPLEFT_Y_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff &lt;&lt; 0)<br>-#defi=
ne VIDOSDxA_TOPLEFT_Y_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0)<br>

-#define VIDOSDxA_TOPLEFT_Y_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff)<br>-#=
define VIDOSDxA_TOPLEFT_Y(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &amp; =
0x7ff) &lt;&lt; 0)<br>-<br>-#define VIDOSDxB_BOTRIGHT_X_E(_x) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0((((_x) &amp; 0x800) &gt;&gt; 11) &lt;&lt; 23)<br>

-#define VIDOSDxB_BOTRIGHT_X_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &lt;&l=
t; 11)<br>-#define VIDOSDxB_BOTRIGHT_X_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(11=
)<br>-#define VIDOSDxB_BOTRIGHT_X_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff)<=
br>-#define VIDOSDxB_BOTRIGHT_X(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(((_x) &amp; 0x7ff) &lt;&lt; 11)<br>

-<br>-#define VIDOSDxB_BOTRIGHT_Y_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0((((_x) =
&amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>-#define VIDOSDxB_BOTRIGHT_Y_MASK=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &lt;&lt; 0)<br>-#define VIDOSDxB_BOTRIG=
HT_Y_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0)<br>

-#define VIDOSDxB_BOTRIGHT_Y_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff)<br>-#=
define VIDOSDxB_BOTRIGHT_Y(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(((_x) &amp; 0x7ff) &lt;&lt; 0)<br>-<br>-/* For VIDOSD[1..4]C */<br>-#de=
fine VIDISD14C_ALPHA0_R(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;&lt; =
20)<br>

-#define VIDISD14C_ALPHA0_G_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 16)<br>-#define VIDISD14C_ALPHA0_G_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (16)<br>-#define VIDISD14C_ALPHA0_G_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>-#define VIDISD14C_ALPHA0_G(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 16)<br>

-#define VIDISD14C_ALPHA0_B_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 12)<br>-#define VIDISD14C_ALPHA0_B_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (12)<br>-#define VIDISD14C_ALPHA0_B_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>-#define VIDISD14C_ALPHA0_B(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 12)<br>

-#define VIDISD14C_ALPHA1_R_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 8)<br>-#define VIDISD14C_ALPHA1_R_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (8)<br>-#define VIDISD14C_ALPHA1_R_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>-#define VIDISD14C_ALPHA1_R(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 8)<br>

-#define VIDISD14C_ALPHA1_G_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 4)<br>-#define VIDISD14C_ALPHA1_G_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (4)<br>-#define VIDISD14C_ALPHA1_G_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>-#define VIDISD14C_ALPHA1_G(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 4)<br>

-#define VIDISD14C_ALPHA1_B_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 0)<br>-#define VIDISD14C_ALPHA1_B_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0)<br>-#define VIDISD14C_ALPHA1_B_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>-#define VIDISD14C_ALPHA1_B(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 0)<br>

-<br>-/* Video buffer addresses */<br>-#define VIDW_BUF_START(_buff) =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xA0 + ((_buff) * 8))<br>-#define VIDW_BUF_=
START1(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xA4 + ((_buff) * 8))<br>-#d=
efine VIDW_BUF_END(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xD0 + ((=
_buff) * 8))<br>

-#define VIDW_BUF_END1(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xD4 + (=
(_buff) * 8))<br>-#define VIDW_BUF_SIZE(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x100 + ((_buff) * 4))<br>-<br>-#define VIDW_BUF_SIZE_OFFSET_E(_x)=
 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) &amp; 0x2000) &gt;&gt; 13) &lt;&lt; 27)<br=
>

-#define VIDW_BUF_SIZE_OFFSET_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1fff &lt;&=
lt; 13)<br>-#define VIDW_BUF_SIZE_OFFSET_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 (13)=
<br>-#define VIDW_BUF_SIZE_OFFSET_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 (0x1fff)<br=
>-#define VIDW_BUF_SIZE_OFFSET(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &amp;=
 0x1fff) &lt;&lt; 13)<br>

-<br>-#define VIDW_BUF_SIZE_PAGEWIDTH_E(_x) =A0 =A0 =A0 =A0 =A0((((_x) &amp=
; 0x2000) &gt;&gt; 13) &lt;&lt; 26)<br>-#define VIDW_BUF_SIZE_PAGEWIDTH_MAS=
K =A0 =A0 =A0 =A0 =A0 (0x1fff &lt;&lt; 0)<br>-#define VIDW_BUF_SIZE_PAGEWID=
TH_SHIFT =A0 =A0 =A0 =A0 =A0(0)<br>

-#define VIDW_BUF_SIZE_PAGEWIDTH_LIMIT =A0 =A0 =A0 =A0 =A0(0x1fff)<br>-#def=
ine VIDW_BUF_SIZE_PAGEWIDTH(_x) =A0 =A0 =A0 =A0 =A0 =A0(((_x) &amp; 0x1fff)=
 &lt;&lt; 0)<br>-<br>-/* Interrupt controls and status */<br>-<br>-#define =
VIDINTCON0_FIFOINTERVAL_MASK =A0 =A0 =A0 =A0 =A0 (0x3f &lt;&lt; 20)<br>

-#define VIDINTCON0_FIFOINTERVAL_SHIFT =A0 =A0 =A0 =A0 =A0(20)<br>-#define =
VIDINTCON0_FIFOINTERVAL_LIMIT =A0 =A0 =A0 =A0 =A0(0x3f)<br>-#define VIDINTC=
ON0_FIFOINTERVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 20)<br>-<br>-#de=
fine VIDINTCON0_INT_SYSMAINCON =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 19)<b=
r>

-#define VIDINTCON0_INT_SYSSUBCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 1=
8)<br>-#define VIDINTCON0_INT_I80IFDONE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;=
&lt; 17)<br>-<br>-#define VIDINTCON0_FRAMESEL0_MASK =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0x3 &lt;&lt; 15)<br>-#define VIDINTCON0_FRAMESEL0_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 (15)<br>

-#define VIDINTCON0_FRAMESEL0_BACKPORCH =A0 =A0 =A0 =A0 (0x0 &lt;&lt; 15)<b=
r>-#define VIDINTCON0_FRAMESEL0_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt;=
 15)<br>-#define VIDINTCON0_FRAMESEL0_ACTIVE =A0 =A0 =A0 =A0 =A0 =A0(0x2 &l=
t;&lt; 15)<br>-#define VIDINTCON0_FRAMESEL0_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 &lt;&lt; 15)<br>

-<br>-#define VIDINTCON0_FRAMESEL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &=
lt;&lt; 13)<br>-#define VIDINTCON0_FRAMESEL1_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 13)<br>-#define VIDINTCON0_FRAMESEL1_NONE =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x0 &lt;&lt; 13)<br>-#define VIDINTCON0_FRAMESEL1_BACKPORCH =A0=
 =A0 =A0 =A0 (0x1 &lt;&lt; 13)<br>

-#define VIDINTCON0_FRAMESEL1_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt; 1=
3)<br>-#define VIDINTCON0_FRAMESEL1_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 13)<br>-<br>-#define VIDINTCON0_INT_FRAME =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 12)<br>-#define VIDINTCON0_FIFIOSEL_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7f &lt;&lt; 5)<br>

-#define VIDINTCON0_FIFIOSEL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(5)<br>-#defi=
ne VIDINTCON0_FIFIOSEL_WINDOW0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 5)<br>-=
#define VIDINTCON0_FIFIOSEL_WINDOW1 =A0 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 5)=
<br>-<br>-#define VIDINTCON0_FIFOLEVEL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7=
 &lt;&lt; 2)<br>

-#define VIDINTCON0_FIFOLEVEL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 (2)<br>-#define=
 VIDINTCON0_FIFOLEVEL_TO25PC =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 2)<br>-#d=
efine VIDINTCON0_FIFOLEVEL_TO50PC =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 2)<b=
r>-#define VIDINTCON0_FIFOLEVEL_TO75PC =A0 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt;=
 2)<br>

-#define VIDINTCON0_FIFOLEVEL_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2=
)<br>-#define VIDINTCON0_FIFOLEVEL_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt=
;&lt; 2)<br>-<br>-#define VIDINTCON0_INT_FIFO_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x3 &lt;&lt; 0)<br>-#define VIDINTCON0_INT_FIFO_SHIFT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0)<br>

-#define VIDINTCON0_INT_ENABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&l=
t; 0)<br>-<br>-#define VIDINTCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0x134)<br>-#define VIDINTCON1_INT_I180 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 2)<br>-#define VIDINTCON1_INT_FRAME =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 1)<br>

-#define VIDINTCON1_INT_FIFO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;=
&lt; 0)<br>-<br>-/* Window colour-key control registers */<br>-#define WKEY=
CON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(0x140) /* 6410,V210 */<br>-<br>-#define WKEYCON0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x00)<br>

-#define WKEYCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x04)<br>-<br>-#define WxKEYCON0_KEYBL_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (1 &lt;&lt; 26)<br>-#define WxKEYCON0_KEYEN_F =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 25)<br>-#define WxKEYCON0_DIRCON =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 24)<br>

-#define WxKEYCON0_COMPKEY_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xffffff &=
lt;&lt; 0)<br>-#define WxKEYCON0_COMPKEY_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0)<br>-#define WxKEYCON0_COMPKEY_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xffffff)<br>-#define WxKEYCON0_COMPKEY(_x)=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 0)<br>

-#define WxKEYCON1_COLVAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xffffff=
 &lt;&lt; 0)<br>-#define WxKEYCON1_COLVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0)<br>-#define WxKEYCON1_COLVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (0xffffff)<br>-#define WxKEYCON1_COLVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ((_x) &lt;&lt; 0)<br>

-<br>-<br>-/* Window blanking (MAP) */<br>-<br>-#define WINxMAP_MAP =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 24)<br>-#define=
 WINxMAP_MAP_COLOUR_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x=
ffffff &lt;&lt; 0)<br>-#define WINxMAP_MAP_COLOUR_SHIFT =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (0)<br>

-#define WINxMAP_MAP_COLOUR_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xffffff)<br=
>-#define WINxMAP_MAP_COLOUR(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;=
&lt; 0)<br>-<br>-#define WPALCON_PAL_UPDATE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (1 &lt;&lt; 9)<br>-#define WPALCON_W1PAL_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0x7 &lt;&lt; 3)<br>

-#define WPALCON_W1PAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(3)<br>=
-#define WPALCON_W1PAL_25BPP_A888 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&lt;=
 3)<br>-#define WPALCON_W1PAL_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0x1 &lt;&lt; 3)<br>-#define WPALCON_W1PAL_19BPP_A666 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x2 &lt;&lt; 3)<br>

-#define WPALCON_W1PAL_18BPP_A665 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt;=
 3)<br>-#define WPALCON_W1PAL_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0x4 &lt;&lt; 3)<br>-#define WPALCON_W1PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x5 &lt;&lt; 3)<br>-#define WPALCON_W1PAL_16BPP_565 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x6 &lt;&lt; 3)<br>

-<br>-#define WPALCON_W0PAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
x7 &lt;&lt; 0)<br>-#define WPALCON_W0PAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0)<br>-#define WPALCON_W0PAL_25BPP_A888 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0x0 &lt;&lt; 0)<br>-#define WPALCON_W0PAL_24BPP =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 0)<br>

-#define WPALCON_W0PAL_19BPP_A666 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt;=
 0)<br>-#define WPALCON_W0PAL_18BPP_A665 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &=
lt;&lt; 0)<br>-#define WPALCON_W0PAL_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x4 &lt;&lt; 0)<br>-#define WPALCON_W0PAL_16BPP_A555 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0x5 &lt;&lt; 0)<br>

-#define WPALCON_W0PAL_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x6 &lt;&lt; 0)<br>-<br>-/* Blending equation control */<br>-#defin=
e BLENDCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2=
60)<br>-#define BLENDCON_NEW_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1 &lt;&lt; 0)<br>

-#define BLENDCON_NEW_8BIT_ALPHA_VALUE =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br=
>-#define BLENDCON_NEW_4BIT_ALPHA_VALUE =A0 =A0 =A0 =A0 =A0(0 &lt;&lt; 0)<b=
r>-<br>diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fi=
md.h<br>new file mode 100644<br>

index 0000000..1b5ff4c<br>--- /dev/null<br>+++ b/include/video/samsung_fimd=
.h<br>@@ -0,0 +1,533 @@<br>+/* include/video/samsung_fimd.h<br>+ *<br>+ * C=
opyright 2008 Openmoko, Inc.<br>+ * Copyright 2008 Simtec Electronics<br>

+ * =A0 =A0 =A0<a href=3D"http://armlinux.simtec.co.uk/" target=3D"_blank">=
http://armlinux.simtec.co.uk/</a><br>+ * =A0 =A0 =A0Ben Dooks &lt;<a href=
=3D"mailto:ben@simtec.co.uk">ben@simtec.co.uk</a>&gt;<br>+ *<br>+ * S3C Pla=
tform - new-style fimd and framebuffer register definitions<br>

+ *<br>+ * This is the register set for the fimd and new style framebuffer =
interface<br>+ * found from the S3C2443 onwards into the S3C2416, S3C2450 a=
nd the<br>+ * S3C64XX series such as the S3C6400 and S3C6410.<br>+ *<br>

+ * The file does not contain the cpu specific items which are based on<br>=
+ * whichever architecture is selected, it only contains the core of the<br=
>+ * register set. See &lt;mach/regs-fb.h&gt; to get the specifics.<br>

+ *<br>+ * This program is free software; you can redistribute it and/or mo=
dify<br>+ * it under the terms of the GNU General Public License version 2 =
as<br>+ * published by the Free Software Foundation.<br>+*/<br>+<br>+/* VID=
CON0 */<br>

+<br>+#define VIDCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x00)<br>+#define VIDCON0_INTERLACE =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 29)<br>+#define VIDCON0_VIDOUT_=
MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 26)<br>+#define V=
IDCON0_VIDOUT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (26)<br>

+#define VIDCON0_VIDOUT_RGB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &l=
t;&lt; 26)<br>+#define VIDCON0_VIDOUT_TV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x1 &lt;&lt; 26)<br>+#define VIDCON0_VIDOUT_I80_LDI0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 26)<br>+#define VIDCON=
0_VIDOUT_I80_LDI1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&=
lt; 26)<br>

+<br>+#define VIDCON0_L1_DATA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7=
 &lt;&lt; 23)<br>+#define VIDCON0_L1_DATA_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(23)<br>+#define VIDCON0_L1_DATA_16BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x0 &lt;&lt; 23)<br>+#define VIDCON0_L1_DATA_18BPP16 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 23)<br>

+#define VIDCON0_L1_DATA_18BPP9 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&l=
t; 23)<br>+#define VIDCON0_L1_DATA_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 23)<br>+#define VIDCON0_L1_DATA_18BPP =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(0x4 &lt;&lt; 23)<br>+#define VIDCON0_L1_DATA_16BPP8 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 (0x5 &lt;&lt; 23)<br>

+<br>+#define VIDCON0_L0_DATA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7=
 &lt;&lt; 20)<br>+#define VIDCON0_L0_DATA_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(20)<br>+#define VIDCON0_L0_DATA_16BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x0 &lt;&lt; 20)<br>+#define VIDCON0_L0_DATA_18BPP16 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 20)<br>

+#define VIDCON0_L0_DATA_18BPP9 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&l=
t; 20)<br>+#define VIDCON0_L0_DATA_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 20)<br>+#define VIDCON0_L0_DATA_18BPP =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(0x4 &lt;&lt; 20)<br>+#define VIDCON0_L0_DATA_16BPP8 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 (0x5 &lt;&lt; 20)<br>

+<br>+#define VIDCON0_PNRMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3=
 &lt;&lt; 17)<br>+#define VIDCON0_PNRMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(17)<br>+#define VIDCON0_PNRMODE_RGB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x0 &lt;&lt; 17)<br>+#define VIDCON0_PNRMODE_BGR =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 17)<br>

+#define VIDCON0_PNRMODE_SERIAL_RGB =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt; 1=
7)<br>+#define VIDCON0_PNRMODE_SERIAL_BGR =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;=
&lt; 17)<br>+<br>+#define VIDCON0_CLKVALUP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (1 &lt;&lt; 16)<br>+#define VIDCON0_CLKVAL_F_MASK =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 6)<br>

+#define VIDCON0_CLKVAL_F_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (6)<br>+#de=
fine VIDCON0_CLKVAL_F_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br>+#def=
ine VIDCON0_CLKVAL_F(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;&lt;=
 6)<br>+#define VIDCON0_VLCKFREE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (1 &lt;&lt; 5)<br>

+#define VIDCON0_CLKDIR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; 4)<br>+<br>+#define VIDCON0_CLKSEL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0(0x3 &lt;&lt; 2)<br>+#define VIDCON0_CLKSEL_SHIFT =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (2)<br>+#define VIDCON0_CLKSEL_HCLK =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 2)<br>

+#define VIDCON0_CLKSEL_LCD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &l=
t;&lt; 2)<br>+#define VIDCON0_CLKSEL_27M =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x3 &lt;&lt; 2)<br>+<br>+#define VIDCON0_ENVID =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>+#define VIDCON0_ENVID_F =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; =
0)<br>

+<br>+#define VIDCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x04)<br>+#define VIDCON1_LINECNT_MASK =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &lt;&lt; 16)<br>+#define VIDCON1_LINECNT=
_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(16)<br>+#define VIDCON1_LINECNT_=
GET(_v) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(((_v) &gt;&gt; 16) =
&amp; 0x7ff)<br>

+#define VIDCON1_VSTATUS_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;=
&lt; 13)<br>+#define VIDCON1_VSTATUS_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(13)<br>+#define VIDCON1_VSTATUS_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x0 &lt;&lt; 13)<br>+#define VIDCON1_VSTATUS_BACKPORCH =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x1 &lt;&lt; 13)<br>

+#define VIDCON1_VSTATUS_ACTIVE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&l=
t; 13)<br>+#define VIDCON1_VSTATUS_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =A0 (0x0 =
&lt;&lt; 13)<br>+#define VIDCON1_VCLK_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 &lt;&lt; 9)<br>+#define VIDCON1_VCLK_HOLD =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 9)<br>

+#define VIDCON1_VCLK_RUN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 =
&lt;&lt; 9)<br>+<br>+#define VIDCON1_INV_VCLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (1 &lt;&lt; 7)<br>+#define VIDCON1_INV_HSYNC =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>+#define VIDCON1_INV_VSYNC=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 5)<br>

+#define VIDCON1_INV_VDEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &l=
t;&lt; 4)<br>+<br>+/* VIDCON2 */<br>+<br>+#define VIDCON2 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x08)<br>+#=
define VIDCON2_EN601 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 =
&lt;&lt; 23)<br>

+#define VIDCON2_TVFMTSEL_SW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;=
&lt; 14)<br>+<br>+#define VIDCON2_TVFMTSEL1_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x3 &lt;&lt; 12)<br>+#define VIDCON2_TVFMTSEL1_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(12)<br>+#define VIDCON2_TVFMTSEL1_RGB =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 12)<br>

+#define VIDCON2_TVFMTSEL1_YUV422 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt;=
 12)<br>+#define VIDCON2_TVFMTSEL1_YUV444 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 =
&lt;&lt; 12)<br>+<br>+#define VIDCON2_ORGYCbCr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (1 &lt;&lt; 8)<br>+#define VIDCON2_YUVORDCrCb =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 7)<br>

+<br>+/* PRTCON (S3C6410, S5PC100)<br>+ * Might not be present in the S3C64=
10 documentation,<br>+ * but tests prove it&#39;s there almost for sure; sh=
ouldn&#39;t hurt in any case.<br>+ */<br>+#define PRTCON =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0c)<br>

+#define PRTCON_PROTECT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; 11)<br>+<br>+/* VIDTCON0 */<br>+<br>+#define VIDTCON0_VBPDE_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 24)<br>+#define VIDTC=
ON0_VBPDE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (24)<br>

+#define VIDTCON0_VBPDE_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br=
>+#define VIDTCON0_VBPDE(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) =
&lt;&lt; 24)<br>+<br>+#define VIDTCON0_VBPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0xff &lt;&lt; 16)<br>+#define VIDTCON0_VBPD_SHIFT =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(16)<br>

+#define VIDTCON0_VBPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)<=
br>+#define VIDTCON0_VBPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((=
_x) &lt;&lt; 16)<br>+<br>+#define VIDTCON0_VFPD_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0xff &lt;&lt; 8)<br>+#define VIDTCON0_VFPD_SHIFT =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(8)<br>

+#define VIDTCON0_VFPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)<=
br>+#define VIDTCON0_VFPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((=
_x) &lt;&lt; 8)<br>+<br>+#define VIDTCON0_VSPW_MASK =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 (0xff &lt;&lt; 0)<br>+#define VIDTCON0_VSPW_SHIFT =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0)<br>

+#define VIDTCON0_VSPW_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)<=
br>+#define VIDTCON0_VSPW(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((=
_x) &lt;&lt; 0)<br>+<br>+/* VIDTCON1 */<br>+<br>+#define VIDTCON1_VFPDE_MAS=
K =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff &lt;&lt; 24)<br>

+#define VIDTCON1_VFPDE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (24)<br>+=
#define VIDTCON1_VFPDE_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xff)<br>=
+#define VIDTCON1_VFPDE(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &=
lt;&lt; 24)<br>+<br>+#define VIDTCON1_HBPD_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 (0xff &lt;&lt; 16)<br>

+#define VIDTCON1_HBPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(16)<br=
>+#define VIDTCON1_HBPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)=
<br>+#define VIDTCON1_HBPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
(_x) &lt;&lt; 16)<br>+<br>+#define VIDTCON1_HFPD_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0xff &lt;&lt; 8)<br>

+#define VIDTCON1_HFPD_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(8)<br>=
+#define VIDTCON1_HFPD_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)<=
br>+#define VIDTCON1_HFPD(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((=
_x) &lt;&lt; 8)<br>+<br>+#define VIDTCON1_HSPW_MASK =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 (0xff &lt;&lt; 0)<br>

+#define VIDTCON1_HSPW_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0)<br>=
+#define VIDTCON1_HSPW_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xff)<=
br>+#define VIDTCON1_HSPW(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((=
_x) &lt;&lt; 0)<br>+<br>+#define VIDTCON2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x18)<br>

+#define VIDTCON2_LINEVAL_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) &am=
p; 0x800) &gt;&gt; 11) &lt;&lt; 23)<br>+#define VIDTCON2_LINEVAL_MASK =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff &lt;&lt; 11)<br>+#define VIDTCON2_LIN=
EVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (11)<br>

+#define VIDTCON2_LINEVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff)<br>=
+#define VIDTCON2_LINEVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &a=
mp; 0x7ff) &lt;&lt; 11)<br>+<br>+#define VIDTCON2_HOZVAL_E(_x) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0((((_x) &amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>

+#define VIDTCON2_HOZVAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &l=
t;&lt; 0)<br>+#define VIDTCON2_HOZVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0)<br>+#define VIDTCON2_HOZVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x7ff)<br>+#define VIDTCON2_HOZVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(((_x) &amp; 0x7ff) &lt;&lt; 0)<br>

+<br>+/* WINCONx */<br>+<br>+<br>+#define WINCONx_BITSWP =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 18)<br>+#define WINCONx_BYTSWP =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 17)<br>+#define=
 WINCONx_HAWSWP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt;=
 16)<br>

+#define WINCONx_WSWP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (=
1 &lt;&lt; 15)<br>+#define WINCONx_BURSTLEN_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 &lt;&lt; 9)<br>+#define WINCONx_BURSTLEN_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (9)<br>+#define WINCONx_BURSTLEN_16WORD =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 9)<br>

+#define WINCONx_BURSTLEN_8WORD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&l=
t; 9)<br>+#define WINCONx_BURSTLEN_4WORD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
x2 &lt;&lt; 9)<br>+<br>+#define WINCONx_ENWIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br>+#define WINCON0_BPPMODE_MASK =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

+#define WINCON0_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>+#=
define WINCON0_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>+#define WINCON0_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>+#define WINCON0_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

+#define WINCON0_BPPMODE_8BPP_PALETTE =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2)<=
br>+#define WINCON0_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x5 &lt;&=
lt; 2)<br>+#define WINCON0_BPPMODE_16BPP_1555 =A0 =A0 =A0 =A0 =A0 =A0 (0x7 =
&lt;&lt; 2)<br>+#define WINCON0_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x8 &lt;&lt; 2)<br>

+#define WINCON0_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>+<br>+#define WINCON1_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>+<br>+#define WINCON1_ALPHA_SE=
L =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>+#define WIN=
CON1_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

+#define WINCON1_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>+#=
define WINCON1_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>+#define WINCON1_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>+#define WINCON1_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

+#define WINCON1_BPPMODE_8BPP_PALETTE =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2)<=
br>+#define WINCON1_BPPMODE_8BPP_1232 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt;&=
lt; 2)<br>+#define WINCON1_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x=
5 &lt;&lt; 2)<br>+#define WINCON1_BPPMODE_16BPP_A1555 =A0 =A0 =A0 =A0 =A0 =
=A0(0x6 &lt;&lt; 2)<br>

+#define WINCON1_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0 =A0(0x7 &lt;&lt; 2=
)<br>+#define WINCON1_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt=
;&lt; 2)<br>+#define WINCON1_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x=
9 &lt;&lt; 2)<br>+#define WINCON1_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =
=A0(0xa &lt;&lt; 2)<br>

+#define WINCON1_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>+#define WINCON1_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt=
;&lt; 2)<br>+#define WINCON1_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0x=
d &lt;&lt; 2)<br>+#define WINCON1_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =
=A0(0xd &lt;&lt; 2)<br>

+<br>+/* S5PV210 */<br>+#define SHADOWCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x34)<br>+#define SHADOWCON_WINx_PROTECT(_win) =
=A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; (10 + (_win)))<br>+/* DMA channels (all win=
dows) */<br>+#define SHADOWCON_CHx_ENABLE(_win) =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; (_win))<br>

+/* Local input channels (windows 0-2) */<br>+#define SHADOWCON_CHx_LOCAL_E=
NABLE(_win) =A0 =A0 =A0 (1 &lt;&lt; (5 + (_win)))<br>+<br>+#define VIDOSDxA=
_TOPLEFT_X_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) &amp; 0x800) &gt;&gt; =
11) &lt;&lt; 23)<br>

+#define VIDOSDxA_TOPLEFT_X_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x7ff &lt;&lt; 11)<br>+#define VIDOSDxA_TOPLEFT_X_SHIFT =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 (11)<br>+#define VIDOSDxA_TOPLEFT_X_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x7ff)<br>+#define VIDOSDxA_TOPLEFT_X(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (((_x) &amp; 0x7ff) &lt;&lt; 11)<br>

+<br>+#define VIDOSDxA_TOPLEFT_Y_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) =
&amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>+#define VIDOSDxA_TOPLEFT_Y_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff &lt;&lt; 0)<br>+#defi=
ne VIDOSDxA_TOPLEFT_Y_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0)<br>

+#define VIDOSDxA_TOPLEFT_Y_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff)<br>+#=
define VIDOSDxA_TOPLEFT_Y(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &amp; =
0x7ff) &lt;&lt; 0)<br>+<br>+#define VIDOSDxB_BOTRIGHT_X_E(_x) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0((((_x) &amp; 0x800) &gt;&gt; 11) &lt;&lt; 23)<br>

+#define VIDOSDxB_BOTRIGHT_X_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &lt;&l=
t; 11)<br>+#define VIDOSDxB_BOTRIGHT_X_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(11=
)<br>+#define VIDOSDxB_BOTRIGHT_X_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff)<=
br>+#define VIDOSDxB_BOTRIGHT_X(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(((_x) &amp; 0x7ff) &lt;&lt; 11)<br>

+<br>+#define VIDOSDxB_BOTRIGHT_Y_E(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0((((_x) =
&amp; 0x800) &gt;&gt; 11) &lt;&lt; 22)<br>+#define VIDOSDxB_BOTRIGHT_Y_MASK=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7ff &lt;&lt; 0)<br>+#define VIDOSDxB_BOTRIG=
HT_Y_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0)<br>

+#define VIDOSDxB_BOTRIGHT_Y_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7ff)<br>+#=
define VIDOSDxB_BOTRIGHT_Y(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(((_x) &amp; 0x7ff) &lt;&lt; 0)<br>+<br>+/* For VIDOSD[1..4]C */<br>+#de=
fine VIDISD14C_ALPHA0_R(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;&lt; =
20)<br>

+#define VIDISD14C_ALPHA0_G_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 16)<br>+#define VIDISD14C_ALPHA0_G_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (16)<br>+#define VIDISD14C_ALPHA0_G_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>+#define VIDISD14C_ALPHA0_G(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 16)<br>

+#define VIDISD14C_ALPHA0_B_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 12)<br>+#define VIDISD14C_ALPHA0_B_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (12)<br>+#define VIDISD14C_ALPHA0_B_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>+#define VIDISD14C_ALPHA0_B(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 12)<br>

+#define VIDISD14C_ALPHA1_R_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 8)<br>+#define VIDISD14C_ALPHA1_R_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (8)<br>+#define VIDISD14C_ALPHA1_R_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>+#define VIDISD14C_ALPHA1_R(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 8)<br>

+#define VIDISD14C_ALPHA1_G_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 4)<br>+#define VIDISD14C_ALPHA1_G_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (4)<br>+#define VIDISD14C_ALPHA1_G_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>+#define VIDISD14C_ALPHA1_G(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 4)<br>

+#define VIDISD14C_ALPHA1_B_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf &lt;&lt; 0)<br>+#define VIDISD14C_ALPHA1_B_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0)<br>+#define VIDISD14C_ALPHA1_B_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0xf)<br>+#define VIDISD14C_ALPHA1_B(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ((_x) &lt;&lt; 0)<br>

+<br>+/* Video buffer addresses */<br>+#define VIDW_BUF_START(_buff) =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xA0 + ((_buff) * 8))<br>+#define VIDW_BUF_=
START1(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xA4 + ((_buff) * 8))<br>+#d=
efine VIDW_BUF_END(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xD0 + ((=
_buff) * 8))<br>

+#define VIDW_BUF_END1(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xD4 + (=
(_buff) * 8))<br>+#define VIDW_BUF_SIZE(_buff) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x100 + ((_buff) * 4))<br>+<br>+#define VIDW_BUF_SIZE_OFFSET_E(_x)=
 =A0 =A0 =A0 =A0 =A0 =A0 ((((_x) &amp; 0x2000) &gt;&gt; 13) &lt;&lt; 27)<br=
>

+#define VIDW_BUF_SIZE_OFFSET_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1fff &lt;&=
lt; 13)<br>+#define VIDW_BUF_SIZE_OFFSET_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 (13)=
<br>+#define VIDW_BUF_SIZE_OFFSET_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 (0x1fff)<br=
>+#define VIDW_BUF_SIZE_OFFSET(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((_x) &amp;=
 0x1fff) &lt;&lt; 13)<br>

+<br>+#define VIDW_BUF_SIZE_PAGEWIDTH_E(_x) =A0 =A0 =A0 =A0 =A0((((_x) &amp=
; 0x2000) &gt;&gt; 13) &lt;&lt; 26)<br>+#define VIDW_BUF_SIZE_PAGEWIDTH_MAS=
K =A0 =A0 =A0 =A0 =A0 (0x1fff &lt;&lt; 0)<br>+#define VIDW_BUF_SIZE_PAGEWID=
TH_SHIFT =A0 =A0 =A0 =A0 =A0(0)<br>

+#define VIDW_BUF_SIZE_PAGEWIDTH_LIMIT =A0 =A0 =A0 =A0 =A0(0x1fff)<br>+#def=
ine VIDW_BUF_SIZE_PAGEWIDTH(_x) =A0 =A0 =A0 =A0 =A0 =A0(((_x) &amp; 0x1fff)=
 &lt;&lt; 0)<br>+<br>+/* Interrupt controls and status */<br>+<br>+#define =
VIDINTCON0_FIFOINTERVAL_MASK =A0 =A0 =A0 =A0 =A0 (0x3f &lt;&lt; 20)<br>

+#define VIDINTCON0_FIFOINTERVAL_SHIFT =A0 =A0 =A0 =A0 =A0(20)<br>+#define =
VIDINTCON0_FIFOINTERVAL_LIMIT =A0 =A0 =A0 =A0 =A0(0x3f)<br>+#define VIDINTC=
ON0_FIFOINTERVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 20)<br>+<br>+#de=
fine VIDINTCON0_INT_SYSMAINCON =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 19)<b=
r>

+#define VIDINTCON0_INT_SYSSUBCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 1=
8)<br>+#define VIDINTCON0_INT_I80IFDONE =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;=
&lt; 17)<br>+<br>+#define VIDINTCON0_FRAMESEL0_MASK =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0x3 &lt;&lt; 15)<br>+#define VIDINTCON0_FRAMESEL0_SHIFT =A0 =A0 =A0 =
=A0 =A0 =A0 (15)<br>

+#define VIDINTCON0_FRAMESEL0_BACKPORCH =A0 =A0 =A0 =A0 (0x0 &lt;&lt; 15)<b=
r>+#define VIDINTCON0_FRAMESEL0_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;&lt;=
 15)<br>+#define VIDINTCON0_FRAMESEL0_ACTIVE =A0 =A0 =A0 =A0 =A0 =A0(0x2 &l=
t;&lt; 15)<br>+#define VIDINTCON0_FRAMESEL0_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 &lt;&lt; 15)<br>

+<br>+#define VIDINTCON0_FRAMESEL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &=
lt;&lt; 13)<br>+#define VIDINTCON0_FRAMESEL1_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 13)<br>+#define VIDINTCON0_FRAMESEL1_NONE =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x0 &lt;&lt; 13)<br>+#define VIDINTCON0_FRAMESEL1_BACKPORCH =A0=
 =A0 =A0 =A0 (0x1 &lt;&lt; 13)<br>

+#define VIDINTCON0_FRAMESEL1_VSYNC =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt; 1=
3)<br>+#define VIDINTCON0_FRAMESEL1_FRONTPORCH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x3 &lt;&lt; 13)<br>+<br>+#define VIDINTCON0_INT_FRAME =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 12)<br>+#define VIDINTCON0_FIFIOSEL_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7f &lt;&lt; 5)<br>

+#define VIDINTCON0_FIFIOSEL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(5)<br>+#defi=
ne VIDINTCON0_FIFIOSEL_WINDOW0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 5)<br>+=
#define VIDINTCON0_FIFIOSEL_WINDOW1 =A0 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 5)=
<br>+<br>+#define VIDINTCON0_FIFOLEVEL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x7=
 &lt;&lt; 2)<br>

+#define VIDINTCON0_FIFOLEVEL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 (2)<br>+#define=
 VIDINTCON0_FIFOLEVEL_TO25PC =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 2)<br>+#d=
efine VIDINTCON0_FIFOLEVEL_TO50PC =A0 =A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 2)<b=
r>+#define VIDINTCON0_FIFOLEVEL_TO75PC =A0 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt;=
 2)<br>

+#define VIDINTCON0_FIFOLEVEL_EMPTY =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt; 2=
)<br>+#define VIDINTCON0_FIFOLEVEL_FULL =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt=
;&lt; 2)<br>+<br>+#define VIDINTCON0_INT_FIFO_MASK =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x3 &lt;&lt; 0)<br>+#define VIDINTCON0_INT_FIFO_SHIFT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0)<br>

+#define VIDINTCON0_INT_ENABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&l=
t; 0)<br>+<br>+#define VIDINTCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0x134)<br>+#define VIDINTCON1_INT_I180 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 2)<br>+#define VIDINTCON1_INT_FRAME =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 1)<br>

+#define VIDINTCON1_INT_FIFO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;=
&lt; 0)<br>+<br>+/* Window colour-key control registers */<br>+#define WKEY=
CON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(0x140) /* 6410,V210 */<br>+<br>+#define WKEYCON0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x00)<br>

+#define WKEYCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x04)<br>+<br>+#define WxKEYCON0_KEYBL_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (1 &lt;&lt; 26)<br>+#define WxKEYCON0_KEYEN_F =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 25)<br>+#define WxKEYCON0_DIRCON =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 24)<br>

+#define WxKEYCON0_COMPKEY_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xffffff &=
lt;&lt; 0)<br>+#define WxKEYCON0_COMPKEY_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0)<br>+#define WxKEYCON0_COMPKEY_LIMIT =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xffffff)<br>+#define WxKEYCON0_COMPKEY(_x)=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((_x) &lt;&lt; 0)<br>

+#define WxKEYCON1_COLVAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xffffff=
 &lt;&lt; 0)<br>+#define WxKEYCON1_COLVAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0)<br>+#define WxKEYCON1_COLVAL_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (0xffffff)<br>+#define WxKEYCON1_COLVAL(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ((_x) &lt;&lt; 0)<br>

+<br>+<br>+/* Window blanking (MAP) */<br>+<br>+#define WINxMAP_MAP =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 24)<br>+#define=
 WINxMAP_MAP_COLOUR_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x=
ffffff &lt;&lt; 0)<br>+#define WINxMAP_MAP_COLOUR_SHIFT =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (0)<br>

+#define WINxMAP_MAP_COLOUR_LIMIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xffffff)<br=
>+#define WINxMAP_MAP_COLOUR(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((_x) &lt;=
&lt; 0)<br>+<br>+#define WPALCON_PAL_UPDATE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (1 &lt;&lt; 9)<br>+#define WPALCON_W1PAL_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0x7 &lt;&lt; 3)<br>

+#define WPALCON_W1PAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(3)<br>=
+#define WPALCON_W1PAL_25BPP_A888 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&lt;=
 3)<br>+#define WPALCON_W1PAL_24BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0x1 &lt;&lt; 3)<br>+#define WPALCON_W1PAL_19BPP_A666 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x2 &lt;&lt; 3)<br>

+#define WPALCON_W1PAL_18BPP_A665 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &lt;&lt;=
 3)<br>+#define WPALCON_W1PAL_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0x4 &lt;&lt; 3)<br>+#define WPALCON_W1PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 (0x5 &lt;&lt; 3)<br>+#define WPALCON_W1PAL_16BPP_565 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x6 &lt;&lt; 3)<br>

+<br>+#define WPALCON_W0PAL_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0=
x7 &lt;&lt; 0)<br>+#define WPALCON_W0PAL_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0)<br>+#define WPALCON_W0PAL_25BPP_A888 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0x0 &lt;&lt; 0)<br>+#define WPALCON_W0PAL_24BPP =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x1 &lt;&lt; 0)<br>

+#define WPALCON_W0PAL_19BPP_A666 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2 &lt;&lt;=
 0)<br>+#define WPALCON_W0PAL_18BPP_A665 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3 &=
lt;&lt; 0)<br>+#define WPALCON_W0PAL_18BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x4 &lt;&lt; 0)<br>+#define WPALCON_W0PAL_16BPP_A555 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 (0x5 &lt;&lt; 0)<br>

+#define WPALCON_W0PAL_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x6 &lt;&lt; 0)<br>+<br>+/* Blending equation control */<br>+#defin=
e BLENDCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x2=
60)<br>+#define BLENDCON_NEW_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1 &lt;&lt; 0)<br>

+#define BLENDCON_NEW_8BIT_ALPHA_VALUE =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 0)<br=
>+#define BLENDCON_NEW_4BIT_ALPHA_VALUE =A0 =A0 =A0 =A0 =A0(0 &lt;&lt; 0)<b=
r>+<br>+#define S3C_FB_MAX_WIN (5) =A0/* number of hardware windows availab=
le. */<br>+#define VIDCON1_FSTATUS_EVEN =A0 (1 &lt;&lt; 15)<br>

+<br>+/* Video timing controls */<br>+#define VIDTCON0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x10)<br>+#define VIDTCON1 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x14)<br>+#define VID=
TCON2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x18)<br=
>+<br>+/* Window position controls */<br>

+<br>+#define WINCON(_win) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x20 + ((_win) * 4))<br>+<br>+/* OSD1 and OSD4 do not have register D =
*/<br>+<br>+#define VIDOSD_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0(0x40)<br>+<br>+#define VIDINTCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x130)<br>

+<br>+/* WINCONx */<br>+<br>+#define WINCONx_CSCWIDTH_MASK =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 26)<br>+#define WINCONx_CSCWIDTH_SHIFT =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (26)<br>+#define WINCONx_CSCWIDTH_WIDE =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 26)<br>

+#define WINCONx_CSCWIDTH_NARROW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x3 &lt;&lt; 26)<br>+<br>+#define WINCONx_ENLOCAL =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 22)<br>+#define =
WINCONx_BUFSTATUS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 21=
)<br>

+#define WINCONx_BUFSEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 =
&lt;&lt; 20)<br>+#define WINCONx_BUFAUTOEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(1 &lt;&lt; 19)<br>+#define WINCONx_YCbCr =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 13)<br>+<br>+#define WINCON1_LOC=
ALSEL_CAMIF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 23)<br>

+<br>+#define WINCON2_LOCALSEL_CAMIF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt=
;&lt; 23)<br>+#define WINCON2_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>+<br>+#define WINCON2_ALPHA_SE=
L =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 1)<br>+#define WIN=
CON2_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0xf &lt;&lt; 2)<br>

+#define WINCON2_BPPMODE_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)<br>+#=
define WINCON2_BPPMODE_1BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x0 &lt;&l=
t; 2)<br>+#define WINCON2_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(0x1 &lt;&lt; 2)<br>+#define WINCON2_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 (0x2 &lt;&lt; 2)<br>

+#define WINCON2_BPPMODE_8BPP_1232 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x4 &lt;&lt;=
 2)<br>+#define WINCON2_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x5 &=
lt;&lt; 2)<br>+#define WINCON2_BPPMODE_16BPP_A1555 =A0 =A0 =A0 =A0 =A0 =A0(=
0x6 &lt;&lt; 2)<br>+#define WINCON2_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0=
 =A0(0x7 &lt;&lt; 2)<br>

+#define WINCON2_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt;&lt;=
 2)<br>+#define WINCON2_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x9 &lt=
;&lt; 2)<br>+#define WINCON2_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =A0(0x=
a &lt;&lt; 2)<br>+#define WINCON2_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0xb &lt;&lt; 2)<br>

+#define WINCON2_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt;&lt; 2=
)<br>+#define WINCON2_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0xd &lt;&=
lt; 2)<br>+#define WINCON2_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =A0(0xd =
&lt;&lt; 2)<br>+<br>+#define WINCON3_BLD_PIX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 &lt;&lt; 6)<br>

+<br>+#define WINCON3_ALPHA_SEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 &lt;&lt; 1)<br>+#define WINCON3_BPPMODE_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (0xf &lt;&lt; 2)<br>+#define WINCON3_BPPMODE_SHIFT =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(2)<br>+#define WINCON3_BPPMODE_1BPP =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 (0x0 &lt;&lt; 2)<br>

+#define WINCON3_BPPMODE_2BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x1 &lt;=
&lt; 2)<br>+#define WINCON3_BPPMODE_4BPP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (0x2 &lt;&lt; 2)<br>+#define WINCON3_BPPMODE_16BPP_565 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x5 &lt;&lt; 2)<br>+#define WINCON3_BPPMODE_16BPP_A1555 =A0 =A0=
 =A0 =A0 =A0 =A0(0x6 &lt;&lt; 2)<br>

+#define WINCON3_BPPMODE_16BPP_I1555 =A0 =A0 =A0 =A0 =A0 =A0(0x7 &lt;&lt; 2=
)<br>+#define WINCON3_BPPMODE_18BPP_666 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x8 &lt=
;&lt; 2)<br>+#define WINCON3_BPPMODE_18BPP_A1665 =A0 =A0 =A0 =A0 =A0 =A0(0x=
9 &lt;&lt; 2)<br>+#define WINCON3_BPPMODE_19BPP_A1666 =A0 =A0 =A0 =A0 =A0 =
=A0(0xa &lt;&lt; 2)<br>

+#define WINCON3_BPPMODE_24BPP_888 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xb &lt;&lt;=
 2)<br>+#define WINCON3_BPPMODE_24BPP_A1887 =A0 =A0 =A0 =A0 =A0 =A0(0xc &lt=
;&lt; 2)<br>+#define WINCON3_BPPMODE_25BPP_A1888 =A0 =A0 =A0 =A0 =A0 =A0(0x=
d &lt;&lt; 2)<br>+#define WINCON3_BPPMODE_28BPP_A4888 =A0 =A0 =A0 =A0 =A0 =
=A0(0xd &lt;&lt; 2)<br>

+<br>+#define VIDINTCON0_FIFIOSEL_WINDOW2 =A0 =A0 =A0 =A0 =A0 =A0(0x10 &lt;=
&lt; 5)<br>+#define VIDINTCON0_FIFIOSEL_WINDOW3 =A0 =A0 =A0 =A0 =A0 =A0(0x2=
0 &lt;&lt; 5)<br>+#define VIDINTCON0_FIFIOSEL_WINDOW4 =A0 =A0 =A0 =A0 =A0 =
=A0(0x40 &lt;&lt; 5)<br>+<br>+#define DITHMODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x170)<br>

+#define WINxMAP(_win) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(=
0x180 + ((_win) * 4))<br>+<br>+<br>+#define DITHMODE_R_POS_MASK =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 5)<br>+#define DITHMODE_R_POS_SHI=
FT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (5)<br>+#define DITHMODE_R_POS_8BIT =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;&lt; 5)<br>

+#define DITHMODE_R_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1 &l=
t;&lt; 5)<br>+#define DITHMODE_R_POS_5BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x2 &lt;&lt; 5)<br>+<br>+#define DITHMODE_G_POS_MASK =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 3)<br>+#define DITHMODE_G_POS_SHIF=
T =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (3)<br>

+#define DITHMODE_G_POS_8BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &l=
t;&lt; 3)<br>+#define DITHMODE_G_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x1 &lt;&lt; 3)<br>+#define DITHMODE_G_POS_5BIT =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 3)<br>+<br>+#define DITHMODE_B_POS_MASK =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x3 &lt;&lt; 1)<br>

+#define DITHMODE_B_POS_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1)<br>+#=
define DITHMODE_B_POS_8BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x0 &lt;=
&lt; 1)<br>+#define DITHMODE_B_POS_6BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0x1 &lt;&lt; 1)<br>+#define DITHMODE_B_POS_5BIT =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x2 &lt;&lt; 1)<br>

+<br>+#define DITHMODE_DITH_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
(1 &lt;&lt; 0)<br>+<br>+#define WPALCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1A0)<br>+<br>+/* Palette con=
trol */<br>+/* Note for S5PC100: you can still use those macros on WPALCON =
(aka WPALCON_L),<br>

+ * but make sure that WPALCON_H W2PAL-W4PAL entries are zeroed out */<br>+=
#define WPALCON_W4PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&lt; 8)=
<br>+#define WPALCON_W3PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &lt;&l=
t; 7)<br>+#define WPALCON_W2PAL_16BPP_A555 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 &=
lt;&lt; 6)<br>

+<br>+<br>+/* Notes on per-window bpp settings<br>+ *<br>+ * Value =A0 =A0 =
=A0 Win0 =A0 =A0 Win1 =A0 =A0 Win2 =A0 =A0 Win3 =A0 =A0 Win 4<br>+ * 0000 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01(P) =A0 =A0 1(P) =A0 =A0 1(P) =A0 =A0 1(P) =
=A0 =A0 1(P)<br>+ * 0001 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02(P) =A0 =A0 2(P) =
=A0 =A0 2(P) =A0 =A0 2(P) =A0 =A0 2(P)<br>

+ * 0010 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04(P) =A0 =A0 4(P) =A0 =A0 4(P) =A0 =
=A0 4(P) =A0 =A0 -none-<br>+ * 0011 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08(P) =A0=
 =A0 8(P) =A0 =A0 -none- =A0 -none- =A0 -none-<br>+ * 0100 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0-none- =A0 8(A232) =A08(A232) =A0-none- =A0 -none-<br>+ * 01=
01 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A016(565) =A016(565) =A016(565) =A016(565) =
=A0 16(565)<br>

+ * 0110 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 16(A555) 16(A555) 16(A55=
5) =A016(A555)<br>+ * 0111 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A016(I555) 16(I565)=
 16(I555) 16(I555) =A016(I555)<br>+ * 1000 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01=
8(666) =A018(666) =A018(666) =A018(666) =A0 18(666)<br>+ * 1001 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0-none- =A0 18(A665) 18(A665) 18(A665) =A016(A665)<br>

+ * 1010 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 19(A666) 19(A666) 19(A66=
6) =A019(A666)<br>+ * 1011 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A024(888) =A024(888=
) =A024(888) =A024(888) =A0 24(888)<br>+ * 1100 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0-none- =A0 24(A887) 24(A887) 24(A887) =A024(A887)<br>+ * 1101 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0-none- =A0 25(A888) 25(A888) 25(A888) =A025(A888)<br=
>

+ * 1110 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 -none- =A0 -none- =A0 -n=
one- =A0 =A0-none-<br>+ * 1111 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-none- =A0 -n=
one- =A0 -none- =A0 -none- =A0 =A0-none-<br>+*/<br>+<br>+/*FIMD V8 REG OFFS=
ET */<br>+#define FIMD_V8_VIDTCON0 =A0 =A0 =A0 (0x20010)<br>

+#define FIMD_V8_VIDTCON1 =A0 =A0 =A0 (0x20014)<br>+#define FIMD_V8_VIDTCON=
2 =A0 =A0 =A0 (0x20018)<br>+#define FIMD_V8_VIDTCON3 =A0 =A0 =A0 (0x2001C)<=
br>+#define FIMD_V8_VIDCON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x20004)<br><sp=
an class=3D"HOEnZb"><font color=3D"#888888">--<br>

1.7.0.4<br><br>--<br>To unsubscribe from this list: send the line &quot;uns=
ubscribe linux-samsung-soc&quot; in<br>the body of a message to <a href=3D"=
mailto:majordomo@vger.kernel.org">majordomo@vger.kernel.org</a><br>More maj=
ordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.html" ta=
rget=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>

</font></span></blockquote></div><br>

--bcaec520e91160220104c6081a8e--

--===============2063462880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2063462880==--
