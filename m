From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 4/5] mfd: exynos-lpass: Use common soc/exynos-regs-pmu.h
 header
Date: Wed, 15 Mar 2017 13:02:51 +0200
Message-ID: <CAJKOXPeFw-qRcznSvw-+ZYxObXTPjE4bRM37=sGf8aWbR31WEg@mail.gmail.com>
References: <20170314164653.15771-1-krzk@kernel.org>
 <20170314164653.15771-5-krzk@kernel.org>
 <20170315101007.xtnwz7mmkt446sgd@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170315101007.xtnwz7mmkt446sgd@dell>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 15, 2017 at 12:10 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 14 Mar 2017, Krzysztof Kozlowski wrote:
>
>> The MFD-specific header will go away because it duplicates defines from
>> exynos-regs-pmu.h.
>>
>> Reported-by: kbuild test robot <fengguang.wu@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> ---
>>  drivers/mfd/exynos-lpass.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied, thanks.

Hi,

This is also needed for patch 5/5 in the set so I was wondering if
this can be put on separate branch and then shared if phy maintainers
would need it?

Best regards,
Krzysztof
