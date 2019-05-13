From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] usb: core: verify devicetree nodes for USB devices
Date: Mon, 13 May 2019 12:03:18 +0200
Message-ID: <5d0abe9c-613c-d39b-6746-78e5e5c2bbc5@samsung.com>
References: <yw1xpnotufti.fsf@mansr.com>
        <CGME20190509084827eucas1p294962744fe70745c50b69a5349b5de68@eucas1p2.samsung.com>
        <20190509084726.5405-1-m.szyprowski@samsung.com>
        <yw1xlfzfv4ol.fsf@mansr.com>
        <VI1PR04MB5327AD56CA772284DFE663D08B0C0@VI1PR04MB5327.eurprd04.prod.outlook.com>
        <7c5579d2-634a-d705-a451-563939957d57@samsung.com>
        <VI1PR04MB5327B425756FA394C51525208B0F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
        <3544eb61-2bd8-338d-8d62-d95a775528ef@samsung.com>
        <VI1PR04MB5327FAC12E4A3D403E8D92128B0F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5327FAC12E4A3D403E8D92128B0F0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Peter,

On 2019-05-13 11:23, Peter Chen wrote:
>> On 2019-05-13 11:00, Peter Chen wrote:
>>>> On 2019-05-10 05:10, Peter Chen wrote:
>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>>>>>>> Commit 69bec7259853 ("USB: core: let USB device know device node")
>>>>>>> added support for attaching devicetree node for USB devices. The
>>>>>>> mentioned commit however identifies the given USB device node only
>>>>>>> by the
>>>> 'reg'
>>>>>>> property in the host controller children nodes. The USB device
>>>>>>> node however also has to have a 'compatible' property as described
>>>>>>> in Documentation/devicetree/bindings/usb/usb-device.txt. Lack for
>>>>>>> the 'compatible' property check might result in assigning a
>>>>>>> devicetree node, which is not intended to be the proper node for the given
>> USB device.
>>>>>>> This is important especially when USB host controller has
>>>>>>> child-nodes for other purposes. For example, Exynos EHCI and OHCI
>>>>>>> drivers already define child-nodes for each physical root hub port
>>>>>>> and assigns respective PHY controller and parameters for them.
>>>>>>> Those binding predates support for USB devicetree nodes.
>>>>>>>
>>>>>>> Checking for the proper compatibility string allows to mitigate
>>>>>>> the conflict between USB device devicetree nodes and the bindings
>>>>>>> for USB controllers with child nodes. It also fixes the
>>>>>>> side-effect of the other commits, like 01fdf179f4b0 ("usb: core:
>>>>>>> skip interfaces disabled in devicetree"), which incorrectly
>>>>>>> disables some devices on Exynos based boards.
>>>>> Hi Marek,
>>>>>
>>>>> The purpose of your patch is do not set of_node for device under USB
>>>>> controller,
>>>> right?
>>>>
>>>> Right.
>>>>
>>> Do you mind doing it at function exynos_ehci_get_phy of ehci-exynos.c?
>> I don't mind fixing it in ehci-exynos, but frankly so far I have no idea how to do it.
>> The problem is that newly created USB devices get of-node pointer pointing to a
>> node which if not intended for them. How this can be fixed in ehci-exynos?
>>
>   
> Can't be workaround by setting of_node as NULL for EHCI controller or for PHY node at
> exynos_ehci_get_phy?

Ah, such workaround? I will check, but this will need to be done with 
care, because have a side effect for other subsystems like regulators or 
clocks.

BTW, What's wrong with proper, full verification of USB device nodes?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
