From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: samsung: pll: Use new registration method for
 PLL6552 and PLL6553
Date: Tue, 27 Aug 2013 16:45:25 -0700
Message-ID: <20130827234525.8231.17145@quantum>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <158901ce9b34$c0ac8720$42059560$@org> <20130820002258.4443.34197@quantum>
 <1856348.DCxTucbm8V@flatron> <20130827011422.8231.95092@quantum>
 <521CDEDE.1070003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <521CDEDE.1070003@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?utf-8?q?=27Heiko_St=C3=BCbner=27?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>, gregkh@linuxfoundation.org, 'Tomasz Figa' <t.figa@samsung.com>, linux-usb@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, stern@rowland.harvard.edu, 'Mark Brown' <broonie@kernel.org>, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kukjin Kim (2013-08-27 10:16:14)
> On 08/27/13 10:14, Mike Turquette wrote:
> > Quoting Tomasz Figa (2013-08-20 17:33:21)
> >> This patch modifies PLL6552 and PLL6553 clock drivers to use recently
> >> added common Samsung PLL registration method.
> >>
> >> Signed-off-by: Tomasz Figa<tomasz.figa@gmail.com>
> >
> > Sigh. This change won't apply on top of clk-next-s3c64xx since it
> > requires Yadwinder's change (amongst) others.
> >
> > The best I could do was spin out another topic branch with the relevant
> > changes and apply this patch on top. It is a subset of clk-next but it
> > is almost entirely Samsung patches:
> >
> > git://git.linaro.org/people/mturquette/linux.git clk-next-s3c64xx-delta
> >
> > Kukjin&  Tomasz, let me know if this OK for you to add as a dependency
> > to the Samsung tree. If it is I will merge it into clk-next, but I want
> > your OK that this branch is OK for you to take.
> >
> Hi Mike,
> 
> I merged the branch clk-next-s3c64xx-delta you provided on top of 
> previous clk-next-s3c64xx for common-clk-s3c64xx and dt-s3c64xx and it 
> looks fine to me.

Cool. I've merged it into clk-next as well.

Regards,
Mike

> 
> Thanks,
> Kukjin
