From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 00/12] clk/exynos convert clock IDs to macros
Date: Mon, 30 Sep 2013 19:11:41 +0900
Message-ID: <06c101cebdc5$75a83d10$60f8b730$%kim@samsung.com>
References: <1378462361-13680-1-git-send-email-a.hajda@samsung.com>
 <8412301.YP2zzplWoe@amdc1227>
 <070001ceafa5$d4d81a40$7e884ec0$%kim@samsung.com>
 <523716C9.3000204@samsung.com> <20130916193709.27384.86101@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20130916193709.27384.86101@quantum>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Mike Turquette' <mturquette@linaro.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: 'devicetree' <devicetree@vger.kernel.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Mike Turquette wrote:
> 
> Quoting Sylwester Nawrocki (2013-09-16 07:33:45)
> > On 09/12/2013 12:50 PM, Kukjin Kim wrote:
> > > Well...I'm not sure changing to use macro is better or not at this
> moment...
> >
> > I think it is. ;) It's really less error prone to have symbolic names
> instead
> > of the plain numbers. The clock ids are defined in one place and it is
> more
> > clear what a clock is by looking at symbolic name. It's especially
> annoying
> > to use plain numbers where are are many clock in a single node, like 10
> or
> > more. What are you main concerns with this ?
> 
> I think having the symbolic names is a win for readability.
> 
Hmm...since Mike who is a maintainer for ccf agrees with Sylwester's opinion, so I agree. Actually, I had no strong objection on this but still I'm not sure using macro is really better because sometimes the name doesn't give readability really I think though.

Mike, can you give me your ack on clk stuff?

Thanks,
Kukjin
