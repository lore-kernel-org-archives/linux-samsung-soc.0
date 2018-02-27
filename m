From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: inconsistent lock state with usbnet/asix usb ethernet and xhci
Date: Tue, 27 Feb 2018 11:59:43 +0100
Message-ID: <2d4b8902-1f39-723b-5187-8bacf8dfcea2@samsung.com>
References: <CGME20180227072602eucas1p28dcdba711b3153820bd409d838cc63bd@eucas1p2.samsung.com>
        <c15c90ef-ce1b-4dd7-1d9f-673deb01b6d2@samsung.com>
        <1519727870.18525.4.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1519727870.18525.4.camel@suse.com>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oliver Neukum <oneukum@suse.com>, LKML <linux-kernel@vger.kernel.org>, 'LinuxSamsung SOC' <linux-samsung-soc@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, netdev@vger.kernel.org
Cc: Dean Jenkins <Dean_Jenkins@mentor.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Oliver,

On 2018-02-27 11:37, Oliver Neukum wrote:
> Am Dienstag, den 27.02.2018, 08:26 +0100 schrieb Marek Szyprowski:
>
>> I've noticed that USBnet/ASIX AX88772B USB driver produces deplock kernel
>> warning ("inconsistent lock state") on Chromebook2 Peach-PIT board. No
> Is that 32 bit?

Yes. ARM 32bit. Exynos5420 SoC (4 x CortexA15 + 4 x CortexA7 big.LITTLE 
CPUs).

>> special activity is needed to reproduce this issue, it happens almost
>> on every boot. ASIX USB ethernet is connected to XHCI USB host controller
>> on that board. Is it a known issue? Frankly I have no idea where to look
> No, it is not known.
>
>> to fix it. The same adapter connected to EHCI ports on other boards based
>> on the same SoC works fine without any warnings.
> Odd.
>
>> And the log with mentioned warning:
>>
>> [   17.768040] ================================
>> [   17.772239] WARNING: inconsistent lock state
>> [   17.776511] 4.16.0-rc3-next-20180227-00007-g876c53a7493c #453 Not tainted
>> [   17.783329] --------------------------------
>> [   17.787580] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
>> [   17.793607] swapper/0/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
>> [   17.798751]  (&syncp->seq#5){?.-.}, at: [<9b22e5f0>]
>> asix_rx_fixup_internal+0x188/0x288
> Looks like this triggers (in usbnet):
>
>          u64_stats_update_begin(&stats64->syncp);
>          stats64->rx_packets++;
>          stats64->rx_bytes += skb->len;
>          u64_stats_update_end(&stats64->syncp);
>
> That I considered to be called under lock.
> Could you comment this out for testing?

Yes, commenting this out indeed hides the deplock warning.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
