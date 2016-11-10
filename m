From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/7] soc: renesas: Identify SoC and register with the
 SoC bus
Date: Thu, 10 Nov 2016 10:22:13 +0100
Message-ID: <CAMuHMdWox5ksj1xhJ6_n0wNA9j6veX0AzAE0V9Gs26Kvw5C_sw@mail.gmail.com>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
 <1626072.dpWPnWgGl9@wuerfel>
 <CAMuHMdVrdjqWruY=dBjWP=jZuZkc=aTBTMijOyTDfZFcaD_jsA@mail.gmail.com>
 <6723536.97ljqcB8tS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6723536.97ljqcB8tS@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ulf,

On Wed, Nov 9, 2016 at 10:12 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday, November 9, 2016 6:19:06 PM CET Geert Uytterhoeven wrote:
>> On Wed, Nov 9, 2016 at 5:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Wednesday, November 9, 2016 2:34:33 PM CET Geert Uytterhoeven wrote:
>> >> > And Samsung.
>> >> > Shall I create the immutable branch now?
>> >>
>> >> Arnd: are you happy with the new patches and changes?
>> >
>> > I still had some comments for patch 7, but that shouldn't stop
>> > you from creating a branch for the first three so everyone can
>> > build on top of that.
>>
>> Thanks!
>>
>> What about patch [4/7]?
>> Haven't you received it? Your address was in the To-line for all 7 patches.
>
> Ok, I see it now, looks good. That should be included as well then.

Thanks, I've created the branch/tag :

    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
    branch soc-device-match
    signed tag soc-device-match-tag1

In the mean time, Ulf has applied the first two patches to mmc/next, on top
of lots of MMC work :-(

Ulf, as this is not only a dependency for Freescale/NXP (for sdhci-of-esdhc),
but also for Samsung and Renesas, would it still be possible to replace these
two commits

    8b82c17a8ae533d6 base: soc: introduce soc_device_match() interface
    6fa350172b098f0f base: soc: Check for NULL SoC device attributes

by a merge of soc-device-match-tag1?

You can find more info in the full thread at
https://www.spinics.net/lists/devicetree/msg148558.html

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
