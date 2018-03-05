From: Oliver Neukum <oneukum@suse.com>
Subject: Re: inconsistent lock state with usbnet/asix usb ethernet and xhci
Date: Mon, 05 Mar 2018 12:46:07 +0100
Message-ID: <1520250367.3990.9.camel@suse.com>
References: <CGME20180227072602eucas1p28dcdba711b3153820bd409d838cc63bd@eucas1p2.samsung.com>
         <c15c90ef-ce1b-4dd7-1d9f-673deb01b6d2@samsung.com>
         <1519740421.7296.6.camel@gmail.com>
         <bac44c1b-d701-2f6b-5e1e-738befc25c9d@samsung.com>
         <1519744167.7296.8.camel@gmail.com> <1519744400.7296.10.camel@gmail.com>
         <1519747675.2649.3.camel@suse.com>
         <02679502-cf6e-8714-e879-50a922c5d976@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <02679502-cf6e-8714-e879-50a922c5d976@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, netdev@vger.kernel.org, Dean Jenkins <Dean_Jenkins@mentor.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 2018-03-05 at 08:45 +0100, Marek Szyprowski wrote:
> Hi Oliver,
> 
> On 2018-02-27 17:07, Oliver Neukum wrote:
> > Am Dienstag, den 27.02.2018, 07:13 -0800 schrieb Eric Dumazet:
> >> On Tue, 2018-02-27 at 07:09 -0800, Eric Dumazet wrote:
> >>>
> >>> Note that for this one, it seems we also could perform stats updates in
> >>> BH context, since skb is queued via defer_bh()
> >>>
> >>> But simplicity wins I guess.
> >> Thinking more about this, I am not sure we have any guarantee that TX
> >> and RX can not run on multiple cpus.
> >>
> >> Using an unique syncp is not going to be safe, even if we make lockdep
> >> happy enough with the local_irq save/restore.
> > Unfortunately you are right. It is not guaranteed for some hardware.
> 
> Does it mean that the fix proposed by Eric is not the proper solution?

For asix it should work, but asix is unlikely to be the only driver
with that issue. 32 bit recieves less testing nowadays.

	Regards
		Oliver
