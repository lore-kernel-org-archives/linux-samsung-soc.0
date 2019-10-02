From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 RESEND 1/3] ASoC: samsung: arndale: Simplify DAI link
 initialization
Date: Wed, 2 Oct 2019 12:56:14 +0200
Message-ID: <9ddc271f-e88f-8991-2625-b885f2f2fae7@samsung.com>
References: <CGME20191001123637eucas1p25c7551d4c967e4a2855f6c8d3b096ff5@eucas1p2.samsung.com>
 <20191001123625.19370-1-s.nawrocki@samsung.com>
 <20191001175601.GB14762@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001175601.GB14762@sirena.co.uk>
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
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 10/1/19 19:56, Mark Brown wrote:
> On Tue, Oct 01, 2019 at 02:36:23PM +0200, Sylwester Nawrocki wrote:
> 
>> Changes since v1:
>>  - rebased due to reordering patches in the series
>
> These still don't apply, please check and resend specifying what you're
> basing them on - I don't think this is an ordering issue.

Sory, the above is an old comment, it just refers to what I did
between v1 and v2. I'm not sure what happened, the patches were based 
on for-next branch, git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound

I will resend shortly with a fix for issue reported by the kbuild test.

ea7bfc805cee ASoC: samsung: Rename Arndale card driver
2db0e4f97a07 ASoC: samsung: arndale: Add support for WM1811 CODEC
fb5ca16f40f0 ASoC: samsung: arndale: Simplify DAI link initialization
82965165b0a9 Merge branch 'asoc-5.5' into asoc-next
952139a546d0 Merge branch 'asoc-5.4' into asoc-linus
4bb41984bf2f ASoC: max98373: check for device node before parsing
