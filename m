From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: exynos: Add of_node_put() before return
Date: Tue, 1 Oct 2019 21:32:37 +0200
Message-ID: <20191001193237.GB1815@kozik-lap>
References: <20190804160200.5139-1-nishkadg.linux@gmail.com>
 <20190805162154.GA24769@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190805162154.GA24769@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, kgene@kernel.org, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Aug 05, 2019 at 06:21:54PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 04, 2019 at 09:32:00PM +0530, Nishka Dasgupta wrote:
> > Each iteration of for_each_child_of_node puts the previous node, but in
> > the case of a return from the middle of the loop, there is no put, thus
> > causing a memory leak. Hence add an of_node_put before the return.
> > Issue found with Coccinelle.
> > 
> > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 +++-
> 
> Thanks, applied.
>

Hi Nishka,

I am sorry but I missed the v5.4 merge window and did not push this to
Linus. It's my fault. I'll push it this time, for v5.5 (no need for
action from your side).

Best regards,
Krzysztof
