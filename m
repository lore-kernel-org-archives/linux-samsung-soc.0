From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v5 5/6] ARM: dts: Add basic dts include files for Samsung
 S3C64xx SoCs
Date: Wed, 17 Apr 2013 12:46:43 -0500
Message-ID: <CAL_JsqL_i-5SDCsGZCrsxMehLVMGoLO1s_V3R-H6Oa5ff16dEQ@mail.gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
	<1366060483-20342-6-git-send-email-tomasz.figa@gmail.com>
	<516D4D76.2010409@gmail.com>
	<1829212.6niSeTsyIU@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:61376 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966211Ab3DQRqo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 13:46:44 -0400
Received: by mail-qa0-f42.google.com with SMTP id dx4so1615999qab.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Apr 2013 10:46:43 -0700 (PDT)
In-Reply-To: <1829212.6niSeTsyIU@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, "Mark Brown (broonie@opensource.wolfsonmicro.com)" <broonie@opensource.wolfsonmicro.com>, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>

On Tue, Apr 16, 2013 at 8:19 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> On Tuesday 16 of April 2013 08:09:10 Rob Herring wrote:
>> On 04/15/2013 04:14 PM, Tomasz Figa wrote:
>> > This patch adds basic device tree definitions for Samsung S3C64xx SoCs.
>> >
>> > Since all the SoCs in the series are very similar, the files are created
>> > hierarchically - one file for the whole series and then separate files
>> > for particular SoCs including the common one.
>> >
>> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>> > ---
>> >
>> >  arch/arm/boot/dts/s3c6400.dtsi         |  33 ++
>> >  arch/arm/boot/dts/s3c6410.dtsi         |  33 ++
>> >  arch/arm/boot/dts/s3c64xx-pinctrl.dtsi | 683
>> >  +++++++++++++++++++++++++++++++++ arch/arm/boot/dts/s3c64xx.dtsi
>> >  | 136 +++++++
>> >  4 files changed, 885 insertions(+)
>> >  create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
>> >  create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
>> >  create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
>> >  create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
>>
>> [...]
>>
>> > +
>> > +   vic0: interrupt-controller@71200000 {
>>
>> These nodes should be off a "simple-bus" node.
>
> Hmm, is there any reason behind it?
>
> I thought simple bus was just a convenient helper to represent hierarchical
> bus structures if one has a need to do so.

No. The DT should reflect the bus structure of the chip. How
accurately it is done is up to you and the information available, but
you have to have a bus of some sort.

There's obvious examples that don't follow this, but I'd like to not have more.

Rob
