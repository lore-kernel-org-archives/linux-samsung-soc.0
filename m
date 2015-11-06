From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos7: Add pmic s2mps15 device tree node
Date: Fri, 6 Nov 2015 05:58:20 +0530
Message-ID: <CAGOxZ53sL2D7cgo7QsxybXUo3daL7eVePEEurmHheGiXDr+1Fg@mail.gmail.com>
References: <1446724341-3568-1-git-send-email-alim.akhtar@samsung.com> <563BEC5C.9040707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:35351 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965331AbbKFA3A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 19:29:00 -0500
In-Reply-To: <563BEC5C.9040707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 6, 2015 at 5:25 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 05.11.2015 20:52, Alim Akhtar wrote:
>> This patch add pmic (s2mps15) node of espresso board,
>> which includes addition of regulators and pmic-clk sub-nodes.
>
> My comment for fixing capital letters was ignored. Do you disagree with it?
>
Ah! sorry about that, I missed that completely, will re-send.
Thanks!

>>
>> This patch also adds {vmmc,vqmmc}-supply properties for mmc2 node.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>> Changes since v1:
>> * Addressed Javier and Krzysztof review comments.
>> * Removed unused ldo/buck nodes.
>> * Removed always-on properties from ldo/buck to disable them
>> * Added a consumer of pmic supply (like mmc)
>>
>>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |  280 +++++++++++++++++++++++
>>  1 file changed, 280 insertions(+)
>>
>
> Rest looks good, so with the fix above:
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Best regards,
> Krzysztof
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
