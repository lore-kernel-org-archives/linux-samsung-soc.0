From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: Make DP a consumer of DISP1 power domain on Exynos5420
Date: Mon, 4 May 2015 08:57:46 -0700
Message-ID: <CAMAWPa85HcQ66eqg-WaoVqVm+vByTQXZ69jZCmhsaGqLjfKFxQ@mail.gmail.com>
References: <1428870659-5525-1-git-send-email-javier.martinez@collabora.co.uk>
	<552F6750.6020306@collabora.co.uk>
	<55417810.6070202@collabora.co.uk>
	<126501d082dd$af818a30$0e849e90$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48832 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751162AbbEDP5t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 11:57:49 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 74C4A20396
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2015 15:57:48 +0000 (UTC)
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com [209.85.212.179])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 95CB720320
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2015 15:57:47 +0000 (UTC)
Received: by widdi4 with SMTP id di4so115125562wid.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 08:57:46 -0700 (PDT)
In-Reply-To: <126501d082dd$af818a30$0e849e90$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi Kukjin,

On Wed, Apr 29, 2015 at 5:36 PM, Kukjin Kim <kgene@kernel.org> wrote:

[...]

>>
>> Could you please apply $subject to fix the imprecise external abort issue.
>>
> Sure I'll in this weekend.

This patch is still not in linux-next.

Also I think this fix is needed as a fix for mainline v4.1-rc as well,
where the same is happening.

Krzysztof has generously offered to help collecting/queuing/submitting
patches to help improve the maintenance of exynos.  Please work
closely with him share the responsibility of improving the state of
mainline exynos support.

Thanks,

Kevin
