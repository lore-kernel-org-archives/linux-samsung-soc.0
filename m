From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/27] ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
Date: Thu, 10 Apr 2014 11:46:16 +0200
Message-ID: <4996376.GgWd9rnCP3@wuerfel>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397122124-15690-4-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 10 April 2014 18:28:20 Chanwoo Choi wrote:
> This patch add memory mapping for PMU (Power Management Unit) which is used
> for power control of Exynos3250.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Same thing as for the SRAM here, can you work on making this a proper
driver instead?

	Arnd
