From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: Use proper DT compatible string for
 Hardkernel Odroid boards
Date: Thu, 08 Mar 2018 16:29:46 +0100
Message-ID: <8e54b22b-623b-d19f-7b05-b4718391d56d@samsung.com>
References: <CGME20180307174638epcas2p33f071928807ccaa40ad07922c15be31c@epcas2p3.samsung.com>
 <20180307174625.16597-1-s.nawrocki@samsung.com>
 <20180308104054.GA6019@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180308104054.GA6019@sirena.org.uk>
Content-language: en-GB
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 03/08/2018 11:40 AM, Mark Brown wrote:
> On Wed, Mar 07, 2018 at 06:46:25PM +0100, Sylwester Nawrocki wrote:
>> The Odroid boards are manufactured by Hardkernel, not Samsung. New compatible
>> string entries are added, with "hardkernel," instead of "samsung," vendor
>> prefix. Support for the old compatible strings is going to be removed after
>> some time.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Mark, I thought this can be applied through ASoC tree for 4.17-rc1 and then 
I would post related dts patch for subsequent kernel release.

-- 
Thanks,
Sylwester
