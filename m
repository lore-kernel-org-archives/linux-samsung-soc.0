From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] pinctrl: dt-bindings: samsung: add drive strength
 macros for Exynos5433
Date: Fri, 6 Jan 2017 08:48:14 +0200
Message-ID: <20170106064814.khwru5rdulh6jbkl@kozik-lap>
References: <CGME20161230041427epcas1p1e4d0dd5e7f9928664c664b7850dbd87a@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-3-andi.shyti@samsung.com>
 <CACRpkdaE0-4MN+D1THxo7nqQ5qMNZOi7b+cpqE+6-x8RFPuUfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaE0-4MN+D1THxo7nqQ5qMNZOi7b+cpqE+6-x8RFPuUfA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Andi Shyti <andi.shyti@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 30, 2016 at 02:30:47PM +0100, Linus Walleij wrote:
> On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti@samsung.com> wrote:
> 
> > Commit 5db7e3bb87df ("pinctrl: dt-bindings: samsung: Add header with
> > values used for configuration") has added a header file for defining the
> > pinctrl values in order to avoid hardcoded settings in the Exynos
> > DTS related files.
> >
> > Extend samsung.h to the Exynos5433 for drive strength values
> > which are strictly related to the particular SoC and may defer
> > from others.
> >
> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> 
> Patch applied with Chanwoo's review tag.

As agreed, applied with your ack to samsung-soc. I put it on separate
branch so I can provide a tag if needed.

Best regards,
Krzysztof
