From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4] s3c/s3c24xx: arm: leds: Make s3c24xx LEDS driver use
 gpiolib. Fix error disabling pull during probe.
Date: Thu, 29 Dec 2011 12:29:36 +0900
Message-ID: <028601ccc5da$1734a410$459dec30$%kim@samsung.com>
References: <4EE7E0E7.1020802@solonet.org.ua>
 <063a01ccbfac$498513c0$dc8f3b40$%kim@samsung.com>
 <4EFB851F.9080805@solonet.org.ua> <20111229015640.GB4839@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20111229015640.GB4839@sirena.org.uk>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Denis Kuzmenko' <linux@solonet.org.ua>
Cc: linux-samsung-soc@vger.kernel.org, 'Linus Walleij' <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Richard Purdie' <rpurdie@rpsys.net>, 'Joe Perches' <joe@perches.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Wed, Dec 28, 2011 at 11:07:43PM +0200, Denis Kuzmenko wrote:
> > On 12/21/2011 08:46 AM, Kukjin Kim wrote:
> > > Denis Kuzmenko wrote:
> 
> > >> Make s3c24xx LEDS driver use gpiolib. Fix error disabling pull during
> > >> probe.
> 
> > >> Signed-off-by: Denis Kuzmenko <linux@solonet.org.ua>
> 
> > > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> > > Richard, I think, this should be handled in your tree.
> 
> > ping Richard
> 
> Take a look at the git logs - Richard hasn't been actively maintaining a
> tree for the LEDs for some time now.

Hmm, ok. If we can't get his response before release 3.2, I will try to send
this via samsung tree.

Thanks all.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
