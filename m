From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C64XX: Add basic cpuidle driver
Date: Fri, 30 Mar 2012 10:32:54 +0200
Message-ID: <201203301032.54739.heiko@sntech.de>
References: <1323117169-9817-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112061231.22570.heiko@sntech.de> <20111222181359.GA19259@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111222181359.GA19259@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

Am Donnerstag, 22. Dezember 2011, 19:13:59 schrieb Mark Brown:
> On Tue, Dec 06, 2011 at 12:31:21PM +0100, Heiko St?bner wrote:
> > So I'm really looking forward to seeing a possible example on how to
> > support the STOP and DEEP-STOP modes best.
> 
> My plan there for the s3c64xx was to use pm_domain to figure out if the
> system is idle enough to drop down, I've been adding some pm_runtime
> support to provide the information to the core to let it figure this out.

sorry for digging this up again, but do you happen to have some preliminary 
code laying around for this, that I could "borrow"?


Thanks
Heiko
