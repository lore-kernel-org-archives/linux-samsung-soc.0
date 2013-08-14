From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v2 0/7] Add DT nodes for FIMD and DP controller for
 Exynos5420 SoC
Date: Wed, 14 Aug 2013 11:30:23 +0530
Message-ID: <CAGm_ybirjeHYAiU=VL6+sZYTW=p8oY1pEJ3Q9gpXvLdPpEFQKw@mail.gmail.com>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
	<105d01ce98b3$5a395dc0$0eac1940$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:65427 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861Ab3HNGAZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 02:00:25 -0400
In-Reply-To: <105d01ce98b3$5a395dc0$0eac1940$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, InKi Dae <inki.dae@samsung.com>, Ajay kumar <ajaynumb@gmail.com>, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Kukjin,

On Wed, Aug 14, 2013 at 11:28 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Vikas Sajjan wrote:
>>
>> This patchset adds DT nodes for FIMD and DP controller for Exynos5420
>> based SMDK.
>>
>> It moves all common properties of FIMD and DP controller DT node specific
>> to
>> Exynos5 Socs like 5250 and 5420 to exynos5.dtsi file.
>>
>> It also adds required PM domain DT nodes for exynos5420.
>>
>> Is rebased on branch kgene's "for-next"
>> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-
>> samsung.git/log/?h=for-next
>>
>> The DP PHY DT Node is based on Jingoo Han's inflight patchset at
>> http://comments.gmane.org/gmane.linux.drivers.video-input-
>> infrastructure/66435
>>
>> changes since v1:
>>       - Addressed comments given by Tomasz Figa <tomasz.figa@gmail.com>
>>       and Ajay kumar <ajaynumb@gmail.com>
>>
>> Vikas Sajjan (6):
>>   ARM: dts: Move display-timimg information inside FIMD DT node for
>>     exynos5250
>>   ARM: dts: Update FIMD DT node for Exynos5 SoCs
>>   ARM: dts: Add FIMD DT node to exynos5420 DTS files
>>   ARM: dts: Update DP controller DT Node for Exynos5 based SoCs
>>   ARM: dts: Add DP controller DT node to exynos5420 SoC
>>   ARM: dts: Add pin state information for DP HPD support to Exynos5420
>>
>> Yadwinder Singh Brar (1):
>>   ARM: dts: Add basic PM domains for EXYNOS5420
>>
>>  arch/arm/boot/dts/exynos5.dtsi            |   21 +++++++++++
>>  arch/arm/boot/dts/exynos5250-arndale.dts  |    4 ++-
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   32 +++++++++--------
>>  arch/arm/boot/dts/exynos5250.dtsi         |   28 ++++++---------
>>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 ++++
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   31 ++++++++++++++++
>>  arch/arm/boot/dts/exynos5420.dtsi         |   55
>> +++++++++++++++++++++++++++++
>>  7 files changed, 145 insertions(+), 33 deletions(-)
>>
>> --
>> 1.7.9.5
>
> Looks good to me, will apply this whole series with fix typo, timimg? ;-)
>

Thanks.


> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
