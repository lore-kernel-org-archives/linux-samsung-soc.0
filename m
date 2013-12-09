From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow
 board
Date: Tue, 10 Dec 2013 05:56:26 +0900
Message-ID: <52A62E7A.1010006@samsung.com>
References: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com> <CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:47127 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932820Ab3LIU4d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 15:56:33 -0500
In-Reply-To: <CAD=FV=WqgGPZaEz46JLJAPymLA5Wzehgre2Z7X4AFAWN9L_Lvg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, pawel.moll@arm.com, mark.rutland@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On 12/10/13 01:16, Doug Anderson wrote:
> Yuvaraj,
>
> On Sun, Dec 8, 2013 at 10:38 PM, Yuvaraj Kumar C D<yuvaraj.cd@gmail.com>  wrote:
>> Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
>> for exynos5250") missed out handling the exynos5250 snow dts file.
>>
>> Signed-off-by : Abhilash Kesavan<a.kesavan@samsung.com>
>>
>> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
>> ---
>>   arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
>>   arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
>> index 6470536..1ceb62e 100644
>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>> @@ -247,10 +247,6 @@
>>                  };
>>          };
>>
>> -       mmc@12210000 {
>> -               status = "disabled";
>> -       };
>> -
>>          mmc@12220000 {
>>                  num-slots =<1>;
>>                  supports-highspeed;
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index a9395c4..67484d1 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -171,11 +171,20 @@
>>                  };
>>          };
>>
>> +       mmc@12200000 {
>> +               status = "okay";
>> +       };
>> +
>> +       mmc@12220000 {
>> +               status = "okay";
>> +       };
>> +
>
> I probably would have put the 12200000 and 12220000 ones in
> cros5250-common since that's where all of the other stuff relating to
> those ports is.  Some of it may need to be moved around once we get
> the HP Chromebook 11 (exynos5250-spring) in place, but until then it
> seems best to keep it all together.
>
> -Doug

OK, sounds better, I don't know well about the HP Chromebook though ;-)

- Kukjin
