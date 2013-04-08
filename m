From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: Update MFC documentation for clock entries
Date: Mon, 8 Apr 2013 11:44:57 +0530
Message-ID: <CAK9yfHx36Fhz3cZuPme2-nWeFY7=26s96otFrW+otMhS89BbZQ@mail.gmail.com>
References: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
	<1365056815-28000-2-git-send-email-sachin.kamat@linaro.org>
	<515D5F29.8030709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f54.google.com ([209.85.210.54]:45777 "EHLO
	mail-da0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934870Ab3DHGO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 02:14:58 -0400
Received: by mail-da0-f54.google.com with SMTP id p1so2493349dad.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 23:14:57 -0700 (PDT)
In-Reply-To: <515D5F29.8030709@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, patches@linaro.org

Hi Sylwester,

Thanks for your review.

On 4 April 2013 16:38, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> On 04/04/2013 08:26 AM, Sachin Kamat wrote:
>> Added clock entry definitions to MFC bindings document.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  .../devicetree/bindings/media/s5p-mfc.txt          |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
>> index bf0182d..d7b991a 100644
>> --- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
>> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
>> @@ -15,6 +15,9 @@ Required properties:
>>         mapped region.
>>
>>    - interrupts : MFC interrupt number to the CPU.
>> +  - clocks: from common clock binding: handle to mfc clocks.
>> +  - clock-names: from common clock binding: Shall be "sclk_mfc" and "mfc"
>> +              for "samsung,mfc-v5".
>
> Not sure if we shouldn't be more specific about the fact the entries in
> the clocks property must be in same order as names in clock-names. Perhaps
> it's sufficient you mentioned the common clock binding which defines that.

Right.

> Also we should keep the clock names same, regardless which MFC IP version
> those apply to. At least as far as same driver is used for them and the
> number of clocks is same. Thus perhaps this could be:

Right. Since mfc-v6 currently took aclk_333 as second clk instead of
sclk_mfc, I made the description specific to mfc-v5.

>
> - clock-names : from common clock binding: must contain "sclk_mfc" and "mfc",
>         corresponding to entries in the clocks property.

I will update as above.

>
> Please note there is a white space before the first colon, that makes
> it really an important improvement...

Ok.

>
> Please feel free to add my
>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> with those issues addressed.

Thanks.



-- 
With warm regards,
Sachin
