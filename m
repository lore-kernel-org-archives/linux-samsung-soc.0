From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/3] clk: exynos5420: Add IDs for clocks used in PD mfc
Date: Wed, 25 Jun 2014 13:36:42 +0200
Message-ID: <53AAB44A.3070908@samsung.com>
References: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
 <1401105384-8678-3-git-send-email-shaik.ameer@samsung.com>
 <539726A1.4040209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10847 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753432AbaFYLhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:37:08 -0400
In-reply-to: <539726A1.4040209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com, joshi@samsung.com, Arun Kumar K <arun.kk@samsung.com>

On 10.06.2014 17:39, Tomasz Figa wrote:
> Hi,
> 
> On 26.05.2014 13:56, Shaik Ameer Basha wrote:
>> From: Arun Kumar K <arun.kk@samsung.com>
>>
>> Adds IDs for MUX clocks to be used by power domain for MFC
>> for doing re-parenting while pd on/off.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5420.c   |    6 ++++--
>>  include/dt-bindings/clock/exynos5420.h |    2 ++
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Actually, since this patch shouldn't generate any serious conflicts,
feel free to add my

Acked-by: Tomasz Figa <t.figa@samsung.com>

to let the whole series go through Samsung tree.

Best regards,
Tomasz
