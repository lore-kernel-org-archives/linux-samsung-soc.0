From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v3 2/2] arm: dt: Exynos5420: populate cpu node enteries
 to 8 cpus
Date: Thu, 05 Sep 2013 21:22:59 +0200
Message-ID: <5228DA13.1020901@gmail.com>
References: <1378380593-5305-1-git-send-email-chander.kashyap@linaro.org> <1378380593-5305-3-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:33188 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752843Ab3IETXE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 15:23:04 -0400
Received: by mail-ee0-f50.google.com with SMTP id d51so1137206eek.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 12:23:02 -0700 (PDT)
In-Reply-To: <1378380593-5305-3-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

On 09/05/2013 01:29 PM, Chander Kashyap wrote:
> Exynos5420 is octacore SoC from samsung.

s/octacore/octa-core ?
s/samsung/Samsung

> Hence populate all the cpu node enteries.

s/cpu/CPU ?
s/enteries/entries

> Signed-off-by: Chander Kashyap<chander.kashyap@linaro.org>

Subjects of the dts patches normally start with "ARM: dts:".

I guess this all could be corrected while the patch is being applied
to the platform maitainter's tree.

--
Thanks,
Sylwester
