From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 01/11] dma: amba-pl08x: Use bitmap to
 pass variant specific quirks
Date: Tue, 18 Jun 2013 09:47:24 +0200
Message-ID: <CACRpkdbt4fAdnDKuP8bVpwrWoJ-oGNuSbiDZDz5J12ix2qijfQ@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-2-git-send-email-tomasz.figa@gmail.com>
 <20130617184856.GN2718@n2100.arm.linux.org.uk>
 <12368941.dQe8bcScGj@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <12368941.dQe8bcScGj@flatron>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 17, 2013 at 8:56 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 17 of June 2013 19:48:56 Russell King - ARM Linux wrote:
>> On Sun, Jun 16, 2013 at 10:54:08PM +0200, Tomasz Figa wrote:
>> > Instead of defining new bool field in vendor_data struct for each
>> > quirk, it is more reasonable to use a single flags field and make
>> > each quirk use single bits.
>>
>> Please explain why this is better over the existing system, and why it
>> is not just churn for code modification's sake.
>
> It isn't anything important. I just thought that this is a better solution
> to store more than just two flags. Initially I had more of them added in
> further patches, but final version ended with just one, so this can be
> dropped.

I thought about it yesterday and it basically looks to me that
it tries to outsmart the compiler on how to stuff the flags to save
struct space on the heap and hint that they can be determined
quickly by a & operation, this is like premature optimization.

So please go back to the old system.

Yours,
Linus Walleij
