From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: exynos: remove i80-if-timings nodes
Date: Tue, 28 Nov 2017 12:56:08 +0100
Message-ID: <CAJKOXPfPovJX-7hoD9ORTx7h8pLK1-oiSvpFCHmJEHzoPDRbyA@mail.gmail.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
 <CGME20170824133412eucas1p23233d7bed8b83d86b26de01bc1ecf2a1@eucas1p2.samsung.com>
 <1503581639-580-11-git-send-email-a.hajda@samsung.com> <20170908164752.mrxqrhkszmfqbk6x@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908164752.mrxqrhkszmfqbk6x@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 8, 2017 at 6:47 PM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Aug 24, 2017 at 03:33:59PM +0200, Andrzej Hajda wrote:
>> Since i80/command mode is determined in runtime by propagating info
>> from panel this property can be removed.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>
> I understand this should go in after merging the driver changes to
> preserve bisectability?

Dear Inki Dae,

This was a DeviceTree patch and it should be kept separate from driver
changes. You should not apply it then. Especially without an ack from
arm-soc or Exynos maintainers... because the usual path is through
arm-soc.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=88a5e22a90efd12dfde642ed55d4c669ab658b0f

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
