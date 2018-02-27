From: Oliver Neukum <oneukum@suse.com>
Subject: Re: inconsistent lock state with usbnet/asix usb ethernet and xhci
Date: Tue, 27 Feb 2018 17:07:55 +0100
Message-ID: <1519747675.2649.3.camel@suse.com>
References: <CGME20180227072602eucas1p28dcdba711b3153820bd409d838cc63bd@eucas1p2.samsung.com>
         <c15c90ef-ce1b-4dd7-1d9f-673deb01b6d2@samsung.com>
         <1519740421.7296.6.camel@gmail.com>
         <bac44c1b-d701-2f6b-5e1e-738befc25c9d@samsung.com>
         <1519744167.7296.8.camel@gmail.com> <1519744400.7296.10.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519744400.7296.10.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Dumazet <eric.dumazet@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, LKML <linux-kernel@vger.kernel.org>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, netdev@vger.kernel.org
Cc: Dean Jenkins <Dean_Jenkins@mentor.com>
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, den 27.02.2018, 07:13 -0800 schrieb Eric Dumazet:
> On Tue, 2018-02-27 at 07:09 -0800, Eric Dumazet wrote:
> > 
> > 
> > Note that for this one, it seems we also could perform stats updates in
> > BH context, since skb is queued via defer_bh()
> > 
> > But simplicity wins I guess.
> 
> Thinking more about this, I am not sure we have any guarantee that TX
> and RX can not run on multiple cpus.
> 
> Using an unique syncp is not going to be safe, even if we make lockdep
> happy enough with the local_irq save/restore.

Unfortunately you are right. It is not guaranteed for some hardware.

	Regards
		Oliver
