From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v2 03/12] dmaengine: PL08x: Rework LLI
 handling to be less fragile
Date: Thu, 27 Jun 2013 11:31:06 +0200
Message-ID: <CACRpkdYx_K9OkDDcXtHCwg4U3tB+1p3uj35-090sdoH6PU5OZw@mail.gmail.com>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
 <1371933764-24875-4-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdYm7gFVLzRpQ2J97M+-zQAug_ftJhyi_kniTgCk=GT_bQ@mail.gmail.com>
 <2212577.G2ANCYONVo@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2212577.G2ANCYONVo@flatron>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 27, 2013 at 12:04 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>> > +#define MAX_NUM_TSFR_LLIS      512
>>
>> And I like this nice side effect that we allocate a number of LLIs
>> rather than a fixed-size buffer.
>
> As we're at it, is there any reason to choose this particular number of
> LLis? I have calculated it from the buffer size defined originally, but I
> wonder if 512 LLIs for single transfer isn't too much?

Hm that would be some kind of rule-of-thumb thing.

It depends on the typical DMA request size divided by the max
bytes you can stash into an LLI in the smallest case.

For example when issueing things like this:

dd if=/dev/mmc0 of=/dev/null

you can get *really* large LLI lists, maybe if you want to make
a real engineering exercise you could instrument the code to
accumulate a few stats and run this stressful usecase on the
S3C and see where you end up?

Then calculate backwards for the smaller LLI chunks of the
unmodified PL08x and get a proper estimate.

One way forward would be not to hardcode this as a
#define but making it a field of the vendor data I guess.

Yours,
Linus Walleij
