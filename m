From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V4 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 26 Nov 2013 11:59:44 +0530
Message-ID: <CAAgF-BdPPG6QdX_QKOYQ6POKrvYoB4DCqVvoM6DTLjO9u2mRFA@mail.gmail.com>
References: <1380046016-5811-1-git-send-email-abrestic@chromium.org>
 <1380143572-11741-1-git-send-email-abrestic@chromium.org>
 <CAL1qeaE2Y2EkRtbGQUqsxyci6PSSNihObPju-xquy39fV4zOMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL1qeaE2Y2EkRtbGQUqsxyci6PSSNihObPju-xquy39fV4zOMw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, Jiri Kosina <jkosina@suse.cz>S
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mike and Kukjin,

On Tue, Oct 8, 2013 at 10:23 PM, Andrew Bresticker
<abrestic@chromium.org> wrote:
> Hi Mike and Kukjin,
>
> Any decisions regarding this patchset?  I believe all comments have
> been addressed.
>
> Thanks,
> Andrew

Any decisions on this patchset. These can be applied directly on
linux-samsung tree.

>
> On Wed, Sep 25, 2013 at 2:12 PM, Andrew Bresticker
> <abrestic@chromium.org> wrote:
>> The Exynos AudioSS clock controller will later be modified to allow
>> input clocks to be specified via device-tree in order to support
>> multiple Exynos SoCs.  This will introduce a dependency on the core
>> SoC clock controller being initialized first so that the AudioSS driver
>> can look up its input clocks, but the order in which clock providers
>> are probed in of_clk_init() is not guaranteed.  Since deferred probing
>> is not supported in of_clk_init() and the AudioSS block is not the core
>> controller, we can initialize it later as a platform device.
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>> Acked-by: Tomasz Figa <t.figa@samsung.com>
>> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> Changes since v3:
>>  - __init -> __exit for module exit function
>>  - fixed nits from Sylwester
>> Changes since v2:
>>  - add error handling to probe callback
>>  - fixed ordering of of_clk_{add,del}_provider
>>  - fixed nits from Tomasz and Sylwester
>> Changes since v1:
>>  - add clk_unregister() calls to remove callback
>>  - fixed minor nits from Tomasz
>> ---

Thanks
Padma
