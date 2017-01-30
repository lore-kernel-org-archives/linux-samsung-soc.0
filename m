From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable DYNAMIC_DEBUG and get rid
 of old ext3
Date: Mon, 30 Jan 2017 16:35:09 -0300
Message-ID: <fae36789-d016-8dee-12df-ff896a3373b9@osg.samsung.com>
References: <20170130192749.3690-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170130192749.3690-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/30/2017 04:27 PM, Krzysztof Kozlowski wrote:
> DYNAMIC_DEBUG is quite useful for debugging kernels and should not cause
> noticeable performance regressions.  It makes the kernel noticeably
> bigger (around 4%) but this difference should not impact typical
> developer and reference usage of this defconfig.
>
> Sizes:
> zImage-old:       4641496 bytes
> zImage-new:       4811384 bytes
> 
>    text	   data	    bss	    dec	    hex	filename
> 7031229	2570916	 327016	9929161	 9781c9	vmlinux-old
> 7205921	2800052	 327016	10332989 9dab3d	vmlinux-new
>

Agreed, most people usually will end enabling this option when debugging
issues anyways so having enabled by default is quite convenient indeed.

> Additionally, remove the EXT3_FS symbol because it is entirely replaced
> by EXT4_FS.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
