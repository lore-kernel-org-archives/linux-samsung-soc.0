From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH RFC 6/6] ASoC: samsung: Add DT bindings
 documentation for TM2 sound subsystem
Date: Wed, 15 Jun 2016 11:40:37 +0200
Message-ID: <57612295.7070203@metafoo.de>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, inki.dae@samsung.com, beomho.seo@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 06/13/2016 12:52 PM, Sylwester Nawrocki wrote:
[...]
> + - compatible : "samsung,tm2-audio"
> + - samsung,model : the user-visible name of this sound complex
> + - clocks : must contain an entry for each entry in clock-names,
> +   see ../clocks/clock-bindings.txt for details
> + - clock-names : must include the following entries:
> +   "mclk1", "mclk2"

If these are the MCLKs that go to the CODEC they should be properties of the
CODEC node.
