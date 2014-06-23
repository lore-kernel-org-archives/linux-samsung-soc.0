From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] Documentation: devicetree: Fix s2mps11 and s5m8767 typos
Date: Mon, 23 Jun 2014 16:20:39 -0700
Message-ID: <CAD=FV=Wvu9WzTACovCjmOsce7KUStfAH7PX8rgROA0007HrahA@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
	<1403486483-4063-2-git-send-email-afaerber@suse.de>
	<CAK5sBcGM6TLiMfhktGaeL9hvPFbAXN6mWFq=irWUVHnZi=BWNg@mail.gmail.com>
	<53A8B306.1010903@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53A8B306.1010903@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, DOCUMENTATION <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Andreas,

On Mon, Jun 23, 2014 at 4:06 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> I was wondering which character to type, and found two undocumented
> s5m8767_pmic properties downstream (s5m-core,enable-low-jitter and
> s5m-core,device_type =3D <0x2>), which I then left out.

I don't know much about "s5m-core,device_type", but I doubt it's
needed.  You can see <http://crosreview.com/42202> for details.  I
haven't looked but I'd bet that we just get this from the compatible
string now.

I did do a (very!) quick look and I see that low-jitter was originally
implemented in the local 3.4 kernel at <http://crosreview.com/43624>.
=2E..and the local 3.8 kernel at <http://crosreview.com/66037>.

NOTE: it's pretty important to make sure low-jitter is turned on for
Chromebooks if you actually want full functionality.  At least on
exynos5250-snow (with the max77686 PMIC) you'd get occasional (and
very strange and very hard to debug) TPM errors if you didn't have
low-jitter.  The TPM is part of the security model on Chromebooks and
you might have a hard time accessing the encrypted parts of the disk
without it.


-Doug
