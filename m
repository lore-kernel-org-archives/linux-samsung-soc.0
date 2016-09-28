From: ayaka <ayaka@soulik.info>
Subject: Re: [RFC PATCH v3 2/2] drm/panel: Add support for Chunghwa
 CLAA070WP03XG panel
Date: Thu, 29 Sep 2016 03:51:44 +0800
Message-ID: <91b2efcc-4a74-c965-2163-a26a7f11fcd0@soulik.info>
References: <1474311771-23321-1-git-send-email-ayaka@soulik.info>
 <1474311771-23321-3-git-send-email-ayaka@soulik.info>
 <20160923180042.GA7132@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:40718 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752864AbcI1Tvw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Sep 2016 15:51:52 -0400
In-Reply-To: <20160923180042.GA7132@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, a.hajda@samsung.com, devicetree@vger.kernel.org



On 09/24/2016 02:00 AM, Rob Herring wrote:
> On Tue, Sep 20, 2016 at 03:02:51AM +0800, Randy Li wrote:
>> The Chunghwa CLAA070WP03XG is a 7" 1280x800 panel, which can be
>> supported by the simple panel driver.
>>
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>>   .../display/panel/chunghwa,claa070wp03xg.txt       |  7 ++++++
>>   drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
>> new file mode 100644
>> index 0000000..dd22685
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/chunghwa,claa070wp03xg.txt
>> @@ -0,0 +1,7 @@
>> +Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
>> +
>> +Required properties:
>> +- compatible: should be "chunghwa,claa070wp03xg"
> What about VCC, VLED, LED_EN (PWM), LVBIT, LVFMT, DITHER signals?
I didn't see the other simple-panel has that, so I didn't neither.
And I think it would only have VCC and LED_EN(PWM).
>
>> +
>> +This binding is compatible with the simple-panel binding, which is specified
>> +in simple-panel.txt in this directory.
