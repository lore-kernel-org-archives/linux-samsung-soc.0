From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos4x12: Add maudio/gps_alive power
 domain for exynos4x12
Date: Thu, 10 Oct 2013 13:05:54 +0900
Message-ID: <525627A2.70709@samsung.com>
References: <1381365007-1782-1-git-send-email-cw00.choi@samsung.com>
 <1381365007-1782-4-git-send-email-cw00.choi@samsung.com>
 <CAK9yfHxr27nsmaqkE+seDgZAkpUmOsPqdXdeogY89tAXYEEG2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43494 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752032Ab3JJEFv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 00:05:51 -0400
In-reply-to: <CAK9yfHxr27nsmaqkE+seDgZAkpUmOsPqdXdeogY89tAXYEEG2w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, ijc+devicetree@hellion.org.uk, Russell King <linux@arm.linux.org.uk>

On 10/10/2013 12:29 PM, Sachin Kamat wrote:
> On 10 October 2013 06:00, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch maudio/gps_alive power domain to exynos4x12.dtsi.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
>> index ad531fe..c04418e 100644
>> --- a/arch/arm/boot/dts/exynos4x12.dtsi
>> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
>> @@ -35,6 +35,16 @@
>>                 reg = <0x10023CA0 0x20>;
>>         };
>>
>> +       pd_maudio: maudio-power-domain@10023CC0 {
>> +               compatible = "samsung,exynos4210-pd";
>> +               reg = <0x10023CC0 0x20>;
>> +       };
>> +
>> +       pd_gps_alive: gps-alive-power-domain@10023D04 {
>> +               compatible = "samsung,exynos4210-pd";
>> +               reg = <0x10023D00 0x20>;
> 
> There is mismatch between node name and register value.
> 
> 
What is exactly mismatch?

I checked the register address of MAUDIO_CONFIGURATION/GPS_ALIVE_CONFIGURATION regsiter.
- MAUDIO_CONFIGURATION 0x1002_3CC0
- GPS_ALIVE_CONFIGURATION 0x1002_3D00
