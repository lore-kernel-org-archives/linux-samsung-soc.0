From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] exynos-drm: Fix unsupported GEM memory type error
 message to be clear
Date: Tue, 9 Aug 2016 20:27:11 +0200
Message-ID: <20160809182711.GA27335@kozik-lap>
References: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33198 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbcHIS1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 14:27:15 -0400
Content-Disposition: inline
In-Reply-To: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 08, 2016 at 05:48:20PM -0600, Shuah Khan wrote:
> Fix unsupported GEM memory type error message to include the memory type
> information.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
> Changes since v1:
> -- Comment changed to read clearly
> 
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>


Hi,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
