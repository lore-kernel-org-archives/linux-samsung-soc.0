From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Bug] s5p-sss crypto driver doesn't set next AES-CBC IV
Date: Tue, 19 Feb 2019 11:11:16 +0100
Message-ID: <CAKv+Gu_6QNOWN8wd+dpvGocrLhQjvNS4SpMaVqZ86uWtT70yiw@mail.gmail.com>
References: <CGME20190215185148epcas3p23960bfe37c629ebb2103e673509949f4@epcas3p2.samsung.com>
 <20190215185058.GB12909@gmail.com>
 <a78f8033-954f-8b59-b361-557acef3acdd@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a78f8033-954f-8b59-b361-557acef3acdd@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Christoph Manszewski <c.manszewski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Eric Biggers <ebiggers@kernel.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 19 Feb 2019 at 10:58, Kamil Konieczny
<k.konieczny@partner.samsung.com> wrote:
>
> Hi,
>
> On 15.02.2019 19:51, Eric Biggers wrote:
> > Hello,
> >
> > The AES-CBC implementation in the s5p-sss crypto driver is failing the improved
> > crypto self-tests I currently have out for review.  The improved tests check
> > that all CBC implementations update the IV buffer to be the last ciphertext
> > block.  This has always been required so that requests can be chained, but
> > unfortunately it wasn't tested for by the self-tests until now.
> >
> > See the boot logs for Exynos platforms from the KernelCI job here:
> > https://kernelci.org/boot/all/job/ardb/branch/for-kernelci/kernel/v5.0-rc1-149-g64c945c018af/
> >
> > alg: skcipher: cbc-aes-s5p encryption test failed (wrong output IV) on test vector 0, cfg=\"in-place\"
> > 00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41
> > [...]
>
> I checked dmesg logs after my patch with:
>
> root@target:~# dmesg |grep alg: |grep aes
> [    4.087168] crypto: alg: self-tests for aes-generic (aes) passed
> [    6.305202] crypto: alg: self-tests for ecb-aes-s5p (ecb(aes)) passed
> [    6.405489] crypto: alg: self-tests for cbc-aes-s5p (cbc(aes)) passed
> [    6.505000] crypto: alg: self-tests for ctr-aes-s5p (ctr(aes)) passed
>
> and I noticed there are no cbc-aes-generic nor ctr-aes-generic
>
> Did you test them in separate tree ? Why they are not registered in /proc/crypto ?
>

Generic CBC and CTR are template based, so they are only instantiated on demand.
