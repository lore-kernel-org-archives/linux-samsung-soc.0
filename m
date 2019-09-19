From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
Date: Thu, 19 Sep 2019 15:07:23 +0200
Message-ID: <CAJKOXPedjgXMfiGK=frXeynaqkAWvCcgEVqPeFoL0h8og7MXCA@mail.gmail.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3>
 <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, ckeepax@opensource.cirrus.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> >> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> >> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> >> part of the wm8994 driver so they can be further handled in the audio
> >> CODEC part.
> >
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
>
> The clocks are specified in the (I2C slave device) DT node which corresponds
> to the device as a whole and to which binds the MFD driver.  AFAICT those
> clocks are only needed by the CODEC sub-driver but in general such clocks
> could be used to provide device's system clock used by other functionalities
> than audio.  We are doing something similar for other MFD drivers already
> and I would rather stick to one pattern. IMHO it's clearer to see what
> device the clocks belong to that way.

The existing pattern is not an excuse for doing some things in a
uglier way... If we agree that these are codec-only resources, then
they should be acquired by codec driver. This is one minor step to
solve difficult inter-device dependencies which stops from reusing
parts of the code (some child of MFD heavily depends on parent).
Existing MFD drivers sometimes follow this pattern but that's wrong.
They follow the ugly or even crappy pattern.

Your codec driver still refers to parent and it has its resources,
e.g. parent's device node pointer.

Best regards,
Krzysztof
