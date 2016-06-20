From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 6/6] ASoC: samsung: Add DT bindings
 documentation for TM2 sound subsystem
Date: Mon, 20 Jun 2016 12:49:31 -0500
Message-ID: <CAL_Jsq+=EGo+6PkwjCSUavm+DyvjuXDx2XzteY6xXSP+0u+Z+g@mail.gmail.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
 <20160614233224.GA4477@rob-hp-laptop> <20160615094730.GX2282@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20160615094730.GX2282@sirena.org.uk>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, InKi Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Inha Song <ideal.song@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 15, 2016 at 4:47 AM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Jun 14, 2016 at 06:32:24PM -0500, Rob Herring wrote:
>> On Mon, Jun 13, 2016 at 12:52:40PM +0200, Sylwester Nawrocki wrote:
>
>> > +Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
>
>> > +Required properties:
>
>> > + - compatible : "samsung,tm2-audio"
>
>> SoC specific compatible string please.
>
> No, this isn't a SoC IP - this is a binding for a board called TM2(E)
> which has a bunch of chips on it including this.

Okay, good.

>
>> > + - samsung,i2s-controller : the phandle of the I2S controller
>> > + - samsung,speaker-amplifier : the phandle of the MAX98504 amplifier
>
>> We should have standard properties for these. 2nd ones I've seen today.
>
> No, these aren't fixed roles in a system, you couldn't have standard
> handling for them.

What do you mean? It is silly for us to put vendor prefixes on all of
these. There are dozens of examples in the binding docs of
<vendor>,i2s-controller and <vendor>,audio-codec. Yes, dropping just
the vendor prefix doesn't buy much (maybe some string space), but it
certainly adds nothing.

Rob
