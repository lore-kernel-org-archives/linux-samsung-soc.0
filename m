From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH] ARM: dts: moving dt binding documents for video devices
 to common place
Date: Thu, 7 Feb 2013 08:40:16 +0530
Message-ID: <CAPdUM4NCb9nepsditz7PpEgJ-YQvsdsp1uujMggiiv4pzhxM=Q@mail.gmail.com>
References: <1360162668-29677-1-git-send-email-rahul.sharma@samsung.com>
	<51126DA7.2040309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:40164 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755216Ab3BGDKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 22:10:18 -0500
Received: by mail-we0-f173.google.com with SMTP id r5so1700738wey.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 19:10:17 -0800 (PST)
In-Reply-To: <51126DA7.2040309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

Hi Sylwester,

On Wed, Feb 6, 2013 at 8:20 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi Rahul,
>
> On 02/06/2013 03:57 PM, Rahul Sharma wrote:
>> Binding Documents for drm-devices are placed in
>> Documentation/devicetree/bindings/drm/*. But these devices are common
>> for v4l framework, hence moved to a common place
>> Documentation/devicetree/bindings/video/. 'exynos_' prefix is added to
>> associate them with exynos soc series.
>
> It looks good to me, I would just use 'exynos-' prefix instead,
> this seems to be more common across existing files. Sorry for
> the nitpicking..
>
> I suppose you should address the patch to and base on the tree of
> the device tree maintainers.
>
> Thanks,
> Sylwester

I mentioned it in the patch. Please let me know if it needs to be re-based
to some other tree.

> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> It is base on for-next branch of
> git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
>  .../devicetree/bindings/drm/exynos/hdmi.txt        | 22 ----------------------
>  .../devicetree/bindings/drm/exynos/hdmiddc.txt     | 12 ------------
>  .../devicetree/bindings/drm/exynos/hdmiphy.txt     | 12 ------------
>
> --

Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung India.
