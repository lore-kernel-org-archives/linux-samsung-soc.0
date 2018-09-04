From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] regulator: Fix useless O^2 complexity in
 suspend/resume
Date: Tue, 4 Sep 2018 10:39:00 +0200
Message-ID: <20180904083901eucas1p17c35261c6dcfd51381dafb3b9b0dfaf7~RJaWxxuug2416824168eucas1p10@eucas1p1.samsung.com>
References: <20180903144937.16507-1-m.szyprowski@samsung.com>
        <CGME20180903144947eucas1p26391f4de6bd46d18cf51f075e6f22e2a@eucas1p2.samsung.com>
        <20180903144937.16507-2-m.szyprowski@samsung.com>
        <20180903150911.GO10302@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903150911.GO10302@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 2018-09-03 17:09, Mark Brown wrote:
> On Mon, Sep 03, 2018 at 04:49:36PM +0200, Marek Szyprowski wrote:
>> regulator_pm_ops with regulator_suspend and regulator_resume functions are
>> assigned to every regulator device registered in the system, so there is no
>> need to iterate over all again in them. Replace class_for_each_device()
>> construction with direct operation on the rdev embedded in the given
>> regulator device. This saves a lots of useless operations in suspend and
>> resume paths.
> This would've been better as the second patch since it's an optimization
> and not so urgent for stable.

Frankly, the slow down caused by this O^2 in case of 40 regulators in the
system (not that unusual in nowadays mobiles) is noticeable and quite
annoying. IMHO this is still a good candidate for stable.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
