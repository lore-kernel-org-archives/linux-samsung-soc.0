From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v1 8/9] ASoC: samsung: arndale: Add missing
 OF node dereferencing
Date: Thu, 19 Sep 2019 15:31:05 +0200
Message-ID: <389f0e11-dd00-b373-faef-ed689037340c@samsung.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3>
 <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
 <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, ckeepax@opensource.cirrus.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 9/19/19 14:58, Krzysztof Kozlowski wrote:
> On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> On 9/19/19 10:22, Krzysztof Kozlowski wrote:
>>> Wasn't this issue introduced in 5/9? It looks weird to fix it here...
>> It has not been introduced by 5/9, the issue was there already before
>> my patch, there was even no remove() callback where OF node references
>> could be dropped.
>
> I see. Then please put it as first patch. You should not mix bugfixes
> with features. If mixing, be sure they can be applied before the
> features.

I will see if it is worth the effort to rebase this patch. I didn't bother
with that because this sound card driver is not used in mainline (there is 
no related dts changes) and the patch is a fix for minor bug which I found
just before posting first version of the patch series.

-- 
Thanks,
Sylwester
