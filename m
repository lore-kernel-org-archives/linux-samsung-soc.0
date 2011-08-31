From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Wed, 31 Aug 2011 21:16:17 +0530
Message-ID: <CAJuYYwQ17MPD=hTYUxES5touFfd73W1unbtWfu_XqPR48t3P0w@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
	<4E579C9B.7030807@gmail.com>
	<CAJuYYwR5GqqKjbMngQqorLuka4XN0jin5s6O66orTtSQg5eKRw@mail.gmail.com>
	<4E5CE37E.1050104@gmail.com>
	<CAJuYYwT5HGy9b06AyrLJv5hFCFf_YRA4md9N=m+cwcJNTqRDWg@mail.gmail.com>
	<4E5E2E36.1070006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:56329 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756563Ab1HaPqR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 11:46:17 -0400
Received: by yie30 with SMTP id 30so684915yie.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Aug 2011 08:46:17 -0700 (PDT)
In-Reply-To: <4E5E2E36.1070006@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, vinod.koul@intel.com, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Rob,

On 31 August 2011 18:21, Rob Herring <robherring2@gmail.com> wrote:
> Thomas,

[...]

>> For PL330 dma controllers instantiated from device tree, the channel
>> lookup is based on phandle of the dma controller and dma request id
>> specified by the client node. During probe, the private data of each
>> channel of the controller is set to point to the device node of the
>> dma controller. The 'chan_id' of the each channel is used as the
>> dma request id.
>>
>> Client driver requesting dma channels specify the phandle of the
>> dma controller and the request id. The pl330 filter function
>> converts the phandle to the device node pointer and matches that
>> with channel's private data. If a match is found, the request id
>> from the client node and the 'chan_id' of the channel is matched.
>> A channel is found if both the values match.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0.../devicetree/bindings/dma/arm-pl330.txt =A0 =A0 =A0 =A0 =A0| =A0=
 29 ++++++++++++++++
>> =A0drivers/dma/pl330.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 35 +++++++++++++++++---
>> =A02 files changed, 59 insertions(+), 5 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/dma/arm-pl33=
0.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> new file mode 100644
>> index 0000000..89f4b9c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>> @@ -0,0 +1,29 @@
>> +* ARM PrimeCell PL330 DMA Controller
>> +
>> +The ARM PrimeCell PL330 DMA controller can move blocks of memory co=
ntents
>> +between memory and peripherals or memory to memory.
>> +
>> +Required properties:
>> + =A0- compatible: should be "arm,primecell".
>
> Sorry, I guess I wasn't clear. This has to be "arm,primecell" plus
> something else. In this case, "arm,pl330". If the IP is modified from
> standard ARM version (like ST likes to do), then something like
> "samsung,pl330" would be appropriate.
>
> This is not actually used by the kernel at the moment, but could if
> modified versions of pl330 show up.

of_platform_bus_create() checks for  "arm,primecell" compatible value
to instantiate a amba device from device tree. The peripheral_id is
also noted in the amba device instance. The amba drivers register with
a with a peripheral_id and peripheral_id is used match amba device
with a driver.

In cases of modified version of the same IP, the peripheral_id would
be different. So, "arm,primecell" would just be enough for now. Any
other compatible value would anyway go unused. I did use
"arm,primecell-pdma" and "arm-primecell-mdma" to derive the dma_cap
value. But, as per your comments, I dropped it.

So, for now, I will just list "arm,primecell" as required compatible
value. Please let me know if "arm,pl330" would be required here.

>
>> + =A0- reg: physical base address of the controller and length of me=
mory mapped
>> + =A0 =A0region.
>> + =A0- interrupts: interrupt number to the cpu.
>> +
>> +Example: (from Samsung's Exynos4 processor dtsi file)
>> +
>> + =A0 =A0 pdma0: pdma@12680000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,primecell";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x12680000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <99>;
>> + =A0 =A0 };
>> +
>> +Client drivers (device nodes requiring dma transfers from dev-to-me=
m or
>> +mem-to-dev) should specify the DMA channel numbers using a two-valu=
e pair
>> +as shown below.
>> +
>> + =A0[property name] =A0=3D <[phandle of the dma controller] [dma re=
quest id]>;
>
> At least fix the "-dma-channel" part of the name. It not clear if tha=
t's
> the case or just an example.
>
> [name]-dma-channel =3D <[phandle of the dma controller] [dma request =
id]>;

The name of the property that specifies the dma channel to use is
decided by the client device node. It is not enforced by the dma
device node. So, there will be no specific requirement stated in the
documentation for pl330 device node.

>
>
> The rest looks good.

Thanks for your review and comments.

Regards,
Thomas.

>
> Rob
>

[...]
