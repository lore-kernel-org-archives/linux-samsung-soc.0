From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 25/50] ARM: dts: exynos: add 300MHz to bus_disp1_fimd
 in Exynos5420
Date: Wed, 17 Jul 2019 12:04:36 +0200
Message-ID: <CAJKOXPcfqp2mUXW70=puti7mf0S5LoXF4hFQt5-9tvCgLzjknQ@mail.gmail.com>
References: <CGME20190715124454eucas1p1cd37552b222539b02629cb52e646ae29@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com>
 <20190715124417.4787-26-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190715124417.4787-26-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> According to the documentation max frequency for ACLK300_DISP1 is 300MHz.
> Add an OPP which makes it possible to use the full performance when needed.

Squash it with #23.

BR,
Krzysztof
