From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 4/6] ARM: S5P: Add EPLL rate change
	warning
Date: Wed, 13 Oct 2010 09:09:02 +0100
Message-ID: <20101013080902.GA6424@rakim.wolfsonmicro.main>
References: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
	<1286883983-27790-1-git-send-email-sw.youn@samsung.com>
	<002301cb6aac$12a05e10$37e11a30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <002301cb6aac$12a05e10$37e11a30$%kim@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassi.brar@samsung.com, ben-linux@fluff.org, 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 13, 2010 at 04:55:55PM +0900, Kukjin Kim wrote:
> Seungwhan Youn wrote:

> > This patch adds warning about changing EPLL rate to notice that other
> > driver that controls H/W, which is using EPLL, will has unknown effects
> > by this EPLL rate change.

> > +	printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
> > +			clk->rate, rate);

> Do we really need KERN_WARNING here?
> How about just KERN_INFO?...In my opinion, to change EPLL value seems to be
> nearer 'information' message more than 'warning'.

Personally I don't think it really makes much odds so long as the
message is displayed on the console by default.
