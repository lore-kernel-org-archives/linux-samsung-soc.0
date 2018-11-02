From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 5/5] ARM: spectre-v2: per-CPU vtables to work around
 big.Little systems
Date: Fri, 02 Nov 2018 10:17:05 -0700
Message-ID: <7hk1lv4cxa.fsf@baylibre.com>
References: <20180919094802.GH30658@n2100.armlinux.org.uk>
 <CGME20180919095028epcas3p3e1a927bb7e88c6891d43abfdc51603e7@epcas3p3.samsung.com>
 <E1g2Z6e-0003es-CI@rmk-PC.armlinux.org.uk>
 <20181005090941eucas1p14031cd38d78e9d561975925bf977727d~aq0-OFZeE1866318663eucas1p1b@eucas1p1.samsung.com>
 <20181005094618.GG30658@n2100.armlinux.org.uk>
 <20181030105017.GK30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20181030105017.GK30658@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Julien Thierry <julien.thierry@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, info@kernelci.org, Morten Rasmussen <Morten.Rasmussen@arm.com>, Qais Yousef <Qais.Yousef@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Russell,

Russell King - ARM Linux writes:

> On Fri, Oct 05, 2018 at 10:46:19AM +0100, Russell King - ARM Linux wrote:
>> On Fri, Oct 05, 2018 at 11:09:40AM +0200, Marek Szyprowski wrote:
>> > This patch causes lots of kernel 'BUG' messages on all Samsung Exynos
>> > boards. It started to appear since it has been merged to linux-next
>> > on 20181002. I wonder if this issue is Exynos specific or there are
>> > some patches missing in linux-next, which should fix those 'BUGS'.
>> > If this is Exynos specific, please let us know what should be changed
>> > in Exynos platform code to avoid this issue.
>>
>> Thanks for the report.
>>
>> It looks like my solution for big.Little isn't possible... back to
>> the drawing board, and big.Little will have to remain vulnerable to
>> Spectre for another release cycle.
>
> I've pushed out a new version in my build branch for the autobuilders
> to chew on, but I've little confidence in validating that the problem
> is fixed because the boot results are completely unreliable.
>
> It really doesn't help that kernelci.org flags boot logs as "green"
> and "successful" when they contain such stuff as:
>
> 01:08:40.181846  [    9.309984] Unable to handle kernel paging request at virtual address e7fddef0
>
> which is the kernel hitting a BUG() - for the full log, see:
>
> https://storage.kernelci.org/rmk/to-build/v4.16-38-g9fa10446d304/arm/multi_v7_defconfig/lab-collabora/boot-exynos5800-peach-pi.html
>
> This means the only way to check is to _manually_ go through reading
> each and every boot log - to see if your reported BUG: messages are
> there - no thanks.

You're right, we should be flagging these as boot failures.

> If kernelci thinks that a boot which hits a kernel BUG(), but still
> manages to get to a shell prompt is successful, it's giving very
> misleading boot results.  What about a WARN_ON() or an oops that
> still allows it to reach a shell prompt.
>
> Yes, these may be "successful" in so far as reaching the shell prompt,
> but they should at least be flagged for further inspection, not
> effectively marked as "there is nothing wrong here".

We currently catch stack bactraces like this, and flag them as boot
warnings, and they are shown in the overview:
https://kernelci.org/boot/id/5bd7af1b59b514ece774be08/

But, as you pointed out, that still requires knowing what you're looking
for and manually digging for them as we con't have a good way of
flagging them currently.

What we need to do is catch both warnings (e.g. WARN_ON) etc. as well as
real errors (e.g. BUG/panic/etc.).  In the case of errors, we should
mark the boot test as FAIL.

Kevin
