From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos: fix UART address selection for DEBUG_LL
Date: Wed, 22 Jun 2016 08:24:12 +0200
Message-ID: <CAJKOXPeH_OU1NcHQpXXrnVL+_+RiG5win_k+a0JfWp2Mb3Xh0A@mail.gmail.com>
References: <1411728234-29705-1-git-send-email-jy0922.shim@samsung.com>
 <54BCAA73.5080404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54BCAA73.5080404@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 19, 2015 at 7:55 AM, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
> Hi kukjin,
>
> On 09/26/2014 07:43 PM, Joonyoung Shim wrote:
>> The exynos5 SoCs using A15+A7 can boot to A15 or A7. If it boots using
>> A7, it can't detect right UART physical address only the part number of
>> CP15. It's possible to solve as checking Cluster ID additionally.
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> ---
>>  arch/arm/include/debug/exynos.S | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>

This is an old patch... but still valid and needed on Odroid XU
family. Tested by Marek Szyprowski.

Applied, thanks!

BR,
Krzysztof
