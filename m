From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH] arm: Fix missing api-change from subsys_interface change
Date: Thu, 12 Jan 2012 08:06:05 -0800
Message-ID: <20120112160605.GA10831@suse.de>
References: <201201121430.49448.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39697 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754132Ab2ALQHB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jan 2012 11:07:01 -0500
Content-Disposition: inline
In-Reply-To: <201201121430.49448.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Jan 12, 2012 at 02:30:48PM +0100, Heiko St=FCbner wrote:
> Commit 4a858cfc9a (arm: convert sysdev_class to a regular subsystem)
> converted the samsung sysdevs into subsys_interface instances.
>=20
> While the original add-function only had a (struct sys_device *)
> parameter, the dev_add from subsys_interface needs
> 	(struct device *, struct subsys_interface *)
> leading to "initialized from incompatible pointer type" warnings.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> The patch applies cleanly against the current driver-core git,
> hopefully it's the right tree.

Thanks for fixing this up, sorry for getting it wrong.

This should be done against the Samsung arm git tree, and go in through
that one.  The driver-core git tree is equal to Linus's tree of a few
days ago, there are no driver-core patches in it at the moment.

Kukjin, can you take these?

thanks,

greg k-h
