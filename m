From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: S3C24XX: Add missing DMA device for Mini2440 board
Date: Wed, 10 Aug 2016 11:23:16 +0200
Message-ID: <CAJKOXPejFjBODNMZJWuskm8uK4M4ZmxJEw6wczVLNEnsWF5YHQ@mail.gmail.com>
References: <1470305291-15054-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470305291-15054-1-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 4, 2016 at 12:08 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Addition of s3c2440_device_dma was missed during conversion
> from the Samsung legacy to the regular DMa API.
> Add it so any devices using DMA, e.g I2S controller can
> work properly.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 1 +
>  1 file changed, 1 insertion(+)
>

Thanks, applied.

BR,
Krzysztof
