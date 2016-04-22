From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] drm/exynos/hdmi: Don't print error on deferral due to
 regulators
Date: Fri, 22 Apr 2016 07:28:14 +0200
Message-ID: <5719B66E.9000703@samsung.com>
References: <1461264698-9890-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48604 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbcDVF2T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Apr 2016 01:28:19 -0400
In-reply-to: <1461264698-9890-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>

On 04/21/2016 08:51 PM, Javier Martinez Canillas wrote:
> The regulators may not be available just because their driver's probe
> function was just not executed and so the regulators not registered.
> 
> So, in this case the Exynos HDMI driver should not print logs since
> a -EPROBE_DEFER is not really an error and that will just pollute
> the kernel log and confuse users.
> 
> This patch prevents the following misleading messages to be printed:
> 
> [    1.443638] [drm:hdmi_probe] *ERROR* failed to get regulators
> [    1.449326] [drm:hdmi_probe] *ERROR* hdmi_resources_init failed
> 
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> The real fix for these kind of issues is to change the device model
> core to support device dependencies so the number of probe deferral
> should be minimal or non-existent, instead of fixing on each driver.
> 
> But there have been different attempts [0,1] to implement this and
> there doesn't seem that this will be solved in the short term.
> 
> [0]: https://lkml.org/lkml/2014/5/12/452
> [1]: https://lkml.org/lkml/2015/5/25/251
> 
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Since I like to look at 'dmesg -l err' then I find this useful:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
