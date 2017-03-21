From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v11 0/3] Add support for the S6E3HA2 panel on TM2 board
Date: Tue, 21 Mar 2017 15:42:18 +0900
Message-ID: <5512d06b-770e-d748-b835-0788b01eb684@samsung.com>
References: <CGME20170308014258epcas5p35b908c56e003eb5d2ded8b503aa511be@epcas5p3.samsung.com>
 <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2090162361=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============2090162361==
Content-type: multipart/alternative;
 boundary=------------EA7F2FF7AA0933A8FCEC512B

This is a multi-part message in MIME format.
--------------EA7F2FF7AA0933A8FCEC512B
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit

Dear Thierry,

I would like your review please.

I try to modify it to your advice.
Please let me know if you have any other advice.

Best regards,
Hoegeun

On 03/08/2017 10:42 AM, Hoegeun Kwon wrote:
> Dear Thierry,
>
> I understand that your opinion is:
> It is better to handle the error every time it is input to the
> register, rather than error handling at once in the struct using
> error. This not only makes the code easier to maintain, but also
> reduces unnecessary computation.
>
> So I modified the panel driver to code-by-code error handling.
> If this is not your opinion, could you tell me what your opinion?
>
> Best Regards,
> Hoegeun
>
> Changes for V11:
> - Added the Reviewed-by: Javier Martinez Canillas<javier@osg.samsung.com>
>    (1/3, 3/3 patches)
> - Checked for rebase 4.11 rc1.
>
> Changes for V10:
> - Fixed code-by-code error handling.
>
> Changes for V9:
> - Fixed the te-gpio to optional in bindings
>
> Changes for V8:
> - Applied below two patches: (drm/exynos)
>    : drm/exynos: mic: Add mode_set callback function
>    : drm/exynos: mic: Fix parse_dt function
> - The dt-binding patch and driver patch were divided.
> - Rebase these patches on samsung SoC tree[1] and tm2 touckey patch[2].
>
> Change for V7:
> - Fixed the mode_set callback function of mic device driver.
>    because the mic register is initialized when entering suspend
>    mode, so should set the reg value whenever pre_enable is
>    called.
>
> Changes for V6:
> - Fixed the parse_dt function of dsi device driver.
> - Removed OF graph of panel in DT and DT binding document.
> - Fixed the s6e3ha2 panel device driver.
>    - Fixed from number size to ARRAY_SIZE().
>    - Fixed error handling in mipi_dsi_dcs_* functions.
>    - Fixed the clock of display_mode.
>    - Removed unnecessary casting and error log.
>
> Change for V5:
> - The V5 has only one fix in V4 below.
> - Removed the enable check of the mic driver in mode_set
>    callback, because mode_set should be performed every time.
>
> Changes for V4:
> - Removed display-timings in devicetree, the display-timings has
>    been fixed to be provided by the device driver.
> - Added the mode_set callback function into exynos_drm_mic,
>    because the exynos_drm_mic driver can not parse a videomode
>    struct by removing the display-timings from the devicetree.
>
> Changes for V3:
> - In the DT binding document, made it clearly that the panel is a
>    child node of dsi.
> - Fix reset-gpio active from high to low.
> - Is the OF graph saying related to patch2?
>    Althogh the panel is a child of dsi, I think OF graph necessary.
>    because if a remote-endpoint is not specified, the dsi also
>    panel is not probed.
> - The display-timings has been fixed to be provided by the device
>    driver. however, I think display-timings is necessary in dts.
>    because if dts does not have display-timings, dsi will not load.
>
> Changes for V2:
> - Fixed the samsung,s6e3ha2.txt DT document.
>    - Added active high or low after the description of the GPIOs.
>    - Removed the reg and added a description of the virtual
>      channel number of a DSI peripheral.
>
> Depends on:
> [1]https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/  (for-next branch)
> [2]https://patchwork.kernel.org/patch/9504131/
>      - ("arm64: dts: exynos: Add tm2 touchkey node")
>
> Hoegeun Kwon (2):
>    dt-bindings: Add support for samsung s6e3ha2 panel binding
>    drm/panel: Add support for S6E3HA2 panel driver on TM2 board
>
> Hyungwon Hwang (1):
>    arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board
>
>   .../bindings/display/panel/samsung,s6e3ha2.txt     |  28 +
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  12 +
>   drivers/gpu/drm/panel/Kconfig                      |   6 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 739 +++++++++++++++++++++
>   5 files changed, 786 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
>   create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
>


--------------EA7F2FF7AA0933A8FCEC512B
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Dear Thierry,<br>
    <br>
    I would like your review please.<br>
    <br>
    I try to modify it to your advice.<br>
    Please let me know if you have any other advice.<br>
    <br>
    Best regards,<br>
    Hoegeun<br>
    <br>
    <div class="moz-cite-prefix">On 03/08/2017 10:42 AM, Hoegeun Kwon
      wrote:<br>
    </div>
    <blockquote
      cite="mid:1488937357-5623-1-git-send-email-hoegeun.kwon@samsung.com"
      type="cite">
      <pre wrap="">Dear Thierry,

I understand that your opinion is:
It is better to handle the error every time it is input to the
register, rather than error handling at once in the struct using
error. This not only makes the code easier to maintain, but also
reduces unnecessary computation.

So I modified the panel driver to code-by-code error handling.
If this is not your opinion, could you tell me what your opinion?

Best Regards,
Hoegeun

Changes for V11:
- Added the Reviewed-by: Javier Martinez Canillas <a class="moz-txt-link-rfc2396E" href="mailto:javier@osg.samsung.com">&lt;javier@osg.samsung.com&gt;</a>
  (1/3, 3/3 patches)
- Checked for rebase 4.11 rc1.

Changes for V10:
- Fixed code-by-code error handling.

Changes for V9:
- Fixed the te-gpio to optional in bindings

Changes for V8:
- Applied below two patches: (drm/exynos)
  : drm/exynos: mic: Add mode_set callback function
  : drm/exynos: mic: Fix parse_dt function
- The dt-binding patch and driver patch were divided.
- Rebase these patches on samsung SoC tree[1] and tm2 touckey patch[2].

Change for V7:
- Fixed the mode_set callback function of mic device driver.
  because the mic register is initialized when entering suspend
  mode, so should set the reg value whenever pre_enable is
  called.

Changes for V6:
- Fixed the parse_dt function of dsi device driver.
- Removed OF graph of panel in DT and DT binding document.
- Fixed the s6e3ha2 panel device driver.
  - Fixed from number size to ARRAY_SIZE().
  - Fixed error handling in mipi_dsi_dcs_* functions.
  - Fixed the clock of display_mode.
  - Removed unnecessary casting and error log.

Change for V5:
- The V5 has only one fix in V4 below.
- Removed the enable check of the mic driver in mode_set
  callback, because mode_set should be performed every time.

Changes for V4:
- Removed display-timings in devicetree, the display-timings has
  been fixed to be provided by the device driver.
- Added the mode_set callback function into exynos_drm_mic,
  because the exynos_drm_mic driver can not parse a videomode
  struct by removing the display-timings from the devicetree.

Changes for V3:
- In the DT binding document, made it clearly that the panel is a
  child node of dsi.
- Fix reset-gpio active from high to low.
- Is the OF graph saying related to patch2?
  Althogh the panel is a child of dsi, I think OF graph necessary.
  because if a remote-endpoint is not specified, the dsi also
  panel is not probed.
- The display-timings has been fixed to be provided by the device
  driver. however, I think display-timings is necessary in dts.
  because if dts does not have display-timings, dsi will not load.

Changes for V2:
- Fixed the samsung,s6e3ha2.txt DT document.
  - Added active high or low after the description of the GPIOs.
  - Removed the reg and added a description of the virtual
    channel number of a DSI peripheral.

Depends on:
[1] <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/">https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/</a> (for-next branch)
[2] <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/9504131/">https://patchwork.kernel.org/patch/9504131/</a>
    - ("arm64: dts: exynos: Add tm2 touchkey node")

Hoegeun Kwon (2):
  dt-bindings: Add support for samsung s6e3ha2 panel binding
  drm/panel: Add support for S6E3HA2 panel driver on TM2 board

Hyungwon Hwang (1):
  arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board

 .../bindings/display/panel/samsung,s6e3ha2.txt     |  28 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  12 +
 drivers/gpu/drm/panel/Kconfig                      |   6 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 739 +++++++++++++++++++++
 5 files changed, 786 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EA7F2FF7AA0933A8FCEC512B--

--===============2090162361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2090162361==--
