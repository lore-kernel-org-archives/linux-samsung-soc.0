From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio
	configuration
Date: Mon, 3 Jan 2011 10:30:05 +0900
Message-ID: <AANLkTi=yyE7X1Z-WSP6hj=vb2b38DW=BNm+A7Y=+k2wh@mail.gmail.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
	<1293172938-23615-1-git-send-email-sw.youn@samsung.com>
	<20110102140129.GI4935@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20110102140129.GI4935@opensource.wolfsonmicro.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, jassi.brar@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jan 2, 2011 at 11:01 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Dec 24, 2010 at 03:42:18PM +0900, Seungwhan Youn wrote:
>> This patch adds SMDK audio select configurations based on platform dependacny.
>> This helps more easyly and clearly to make sure about configuration on audio
>> drivers support on platform side.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>
> This doesn't apply against current ASoC; I suspect it needs to be merged
> via the ARM tree.

Yes, patch 1/4 and 2/4 was based on Mr. Kukjin Kim's for-next branch.
So, I hope that Mr. Kukjin Kim sync with you, after he apply these 1,2
patches.
