From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 5/5] ARM: dts: update binding documentation for hdmi subsystem
Date: Thu, 20 Jun 2013 12:07:12 +0530
Message-ID: <CAK9yfHz+n43bt_YvS__f+jhaV6e9tVPc+=QHo0PWpZAzyPNRAA@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
	<1371706911-27016-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:39374 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab3FTGhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:37:12 -0400
Received: by mail-ob0-f173.google.com with SMTP id wc20so6725980obb.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 23:37:12 -0700 (PDT)
In-Reply-To: <1371706911-27016-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

On 20 June 2013 11:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Adding information about clocks to mixer and hdmi dt
> nodes. Also removed the updated fields for hpd property.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Please rebase you patch on top of [1] or fold this into it.

[1] http://permalink.gmane.org/gmane.linux.drivers.devicetree/36162


> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt         |   17 ++++++++++++++---
>  .../devicetree/bindings/video/exynos_mixer.txt        |    4 ++++
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 589edee..5dca3af 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -8,9 +8,20 @@ Required properties:
>  - hpd-gpio: following information about the hotplug gpio pin.
>         a) phandle of the gpio controller node.
>         b) pin number within the gpio controller.
> -       c) pin function mode.
> -       d) optional flags and pull up/down.
> -       e) drive strength.
> +       c) optional flags and pull up/down.
> +- clocks: list of clock IDs from SoC clock driver.
> +       a) hdmi: It is required for gate operation on aclk_200_disp1 clock
> +               which clocks the display1 block.
> +       b) sclk_hdmi: It is required for gate operation on sclk_hdmi clock
> +               which clocks hdmi IP.
> +       c) sclk_pixel: Parent for mux mout_hdmi.
> +       d) sclk_hdmiphy: Parent for mux mout_hdmi.
> +       e) mout_hdmi: It is required by the driver to switch between the 2
> +               parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
> +               after configuration, parent is set to sclk_hdmiphy else
> +               sclk_pixel.
> +- clock-names: aliases as per driver requirements for above clock IDs:
> +       "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>
>  Example:
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> index 9b2ea03..54790a2 100644
> --- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
> @@ -5,6 +5,10 @@ Required properties:
>  - reg: physical base address of the mixer and length of memory mapped
>         region.
>  - interrupts: interrupt number to the cpu.
> +- clocks: list of clock IDs from SoC clock driver.
> +       a) mixer: It is required for gate operation on aclk_200_disp1 clock
> +               which clocks the display1 block.
> +       b) sclk_hdmi: Parent for mux mout_mixer.
>
>  Example:
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
