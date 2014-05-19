From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add MFC memory banks to Exynos5420 boards
Date: Tue, 20 May 2014 01:06:11 +0900
Message-ID: <537A2BF3.4080801@samsung.com>
References: <1395036689-31382-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHy6Ms4c0vDiWs4Dy3acfVViQJpPFNyPGBmmwhAGo4VJKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:47848 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544AbaESQGQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 12:06:16 -0400
Received: by mail-pa0-f44.google.com with SMTP id ld10so5994063pab.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 09:06:16 -0700 (PDT)
In-Reply-To: <CAK9yfHy6Ms4c0vDiWs4Dy3acfVViQJpPFNyPGBmmwhAGo4VJKw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 05/05/14 00:38, Sachin Kamat wrote:
> On 17 March 2014 11:41, Sachin Kamat<sachin.kamat@linaro.org>  wrote:
>> Add MFC memory banks to Exynos5420 based SMDK and Arndale-octa boards.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
>>   arch/arm/boot/dts/exynos5420-smdk5420.dts     |    5 +++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> index f509e8fc290f..051bde7c3665 100644
>> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
>> @@ -37,6 +37,11 @@
>>                  status = "okay";
>>          };
>>
>> +       codec@11000000 {
>> +               samsung,mfc-r =<0x43000000 0x800000>;
>> +               samsung,mfc-l =<0x51000000 0x800000>;
>> +       };
>> +
>>          mmc@12200000 {
>>                  status = "okay";
>>                  broken-cd;
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index ae1ee0470fca..6a9b4553d802 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -68,6 +68,11 @@
>>                  status = "okay";
>>          };
>>
>> +       codec@11000000 {
>> +               samsung,mfc-r =<0x43000000 0x800000>;
>> +               samsung,mfc-l =<0x51000000 0x800000>;
>> +       };
>> +
>>          mmc@12200000 {
>>                  status = "okay";
>>                  broken-cd;
>> --
>> 1.7.9.5

Applied, thanks.

- Kukjin
