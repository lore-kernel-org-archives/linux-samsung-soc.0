From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
Date: Thu, 29 Aug 2019 10:03:09 -0700
Message-ID: <201908291002.2F67F5ADA@keescook>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Kamil Debski <kamil@wypas.org>, Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Nathan Chancellor <natechancellor@gmail.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Anton Sviridenko <anton@corp.bluecherry.net>, Ezequiel Garcia <ezequiel@collabora.com>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Antti Palosaari <crope@iki.fi>, Steve Longerbeam <slongerbeam@gmail.com>, Ismael Luceno <ismael@iodev.co.uk>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Jeongtae Park <jtp.park@samsung.com>, linux-samsung-soc@vger.kern
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 22, 2019 at 04:39:33PM -0300, Mauro Carvalho Chehab wrote:
> Doing something like:
> 
> 	i32 foo = 1, bar;
> 
> 	bar = foo << 31;
> 
> has an undefined behavior in C, as warned by cppcheck, as we're
> shifting a signed integer.
> 
> Instead, force the numbers to be unsigned, in order to solve this
> issue.

I also recommend using the BIT() macro, which does the ULing correctly,
etc.

i.e. instead of:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? 1UL << 31 : 0;

use:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? BIT(31) : 0;

-- 
Kees Cook
