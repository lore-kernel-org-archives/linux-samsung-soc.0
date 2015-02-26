From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Thu, 26 Feb 2015 17:42:38 +0900
Message-ID: <54EEDC7E.9010406@samsung.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
 <7412525.l6YnQcTxtg@wuerfel> <54EC5AB1.5090802@samsung.com>
 <6850624.bdB2Ab6zJx@wuerfel> <54EED6E1.4060908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54EED6E1.4060908@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, jh80.chung@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, a.kesavan@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kgene@kernel.org, olof@lixom.net, chanho61.park@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd,

On 02/26/2015 05:18 PM, Chanwoo Choi wrote:
> On 02/24/2015 08:59 PM, Arnd Bergmann wrote:
>> On Tuesday 24 February 2015 20:04:17 Chanwoo Choi wrote:
>>> On 02/24/2015 06:48 PM, Arnd Bergmann wrote:
>>>> On Tuesday 24 February 2015 17:52:01 Chanwoo Choi wrote:
>>>>>
>>>>> But, I have a question.
>>>>> If we put the aliases into the board dts file instaed of SoC dtsi,
>>>>> each board dts file may use the different alias name about same phandle.
>>>>
>>>> Yes, that is the idea. In particular with the uarts, the intention is
>>>> that the numbering of the device nodes in /dev is the same that is
>>>> printed on the board (if any), which may be different from the numbering
>>>> internal to the SoC.
>>>
>>> I check the uart device with Exynos5433 SoC based on Linux 4.0-rc1
>>> If some board use the serial_0 and serial_3 as following in board dtsi,
>>>
>>>         &serial_0 {             --> UART 0 device
>>>                 status = "okay";
>>>         };
>>>
>>>         &serial_3 {             --> UART 3 device
>>>                 status = "okay";
>>>         };
>>>
>>> The serial core driver create the follwoing /dev/ttySACx device node
>>> by using the number of alias. It maintain the same device number of internel to the SoC.
>>>
>>>         root@localhost:~# ls /dev/ttySAC
>>>         ttySAC1  ttySAC3  
>>>
>>

[snip]

> 
> So, I change the kernel command line about ('console' bootparam) as following:
> because tty framework must use the 'console' bootparam to print kernel log.

I fix the my wrong expression. Some tty driver use the 'console' bootparam.

[snip]

Thanks,
Chanwoo Choi
