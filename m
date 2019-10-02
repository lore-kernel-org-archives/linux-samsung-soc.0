From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/6] opp: Handle target/min/max voltage in
 dev_pm_opp_adjust_voltage()
Date: Wed, 2 Oct 2019 17:54:46 +0200
Message-ID: <ada1bb2f-a824-c34e-6561-04a35782a9b8@samsung.com>
References: <20190910123618.27985-1-s.nawrocki@samsung.com>
 <CGME20190910123636eucas1p250ec04901f227b947cc38936563f63b2@eucas1p2.samsung.com>
 <20190910123618.27985-2-s.nawrocki@samsung.com> <20191002143310.GA15898@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002143310.GA15898@pi3>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, vireshk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 10/2/19 16:33, Krzysztof Kozlowski wrote:
> On Tue, Sep 10, 2019 at 02:36:13PM +0200, Sylwester Nawrocki wrote:
>> To be squashed with patch "PM / OPP: Support adjusting OPP voltages
>> at runtime".
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>
>>  drivers/opp/core.c     | 10 ++++++++--
>>  include/linux/pm_opp.h |  3 ++-
>>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> I'll take the ASV driver via samsung-soc but I see it depends on this
> one.  Please provide me a stable tag with it or an Ack.

There is further dependency on patch 
"[PATCH v4 6/8] PM / OPP: Support adjusting OPP voltages at runtime"
https://lore.kernel.org/linux-arm-kernel/1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com

Viresh, what are your plans WRT to those patches?

-- 
Thanks,
Sylwester
